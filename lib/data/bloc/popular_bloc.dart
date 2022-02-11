


import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_scroll/data/api/remote_data_source.dart';
import 'package:stream_transform/stream_transform.dart';

import '../model/movie_model.dart';


part 'popular_event.dart';
part 'popular_state.dart';

const throttleDuration = Duration(seconds: 1);
EventTransformer<E> throttleDroppable<E>(Duration duration){
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class PopularBloc extends Bloc<PopularEvent, PopularState>{
  PopularBloc() : super(const PopularState()){
   on<PopularEventInit>(_eventGetInfo, transformer: throttleDroppable(throttleDuration));
  }
  int page = 1;
  Future<void> _eventGetInfo(PopularEventInit event, Emitter<PopularState> emit) async{
    try{
      if(state.hasReachedMax) return;
      if(state.status == PopularStatus.initial){
        final model = await RemoteDataSource().getMoviePopular(page);
        if(model != null){
          final list = model.results;
          if(list != null){
            return emit(state.copyWith(
              status: PopularStatus.success,
              list: list,
              hasReachedMax: false,
              total: list.length
            ));
          }else{
            return emit(state.copyWith(status: PopularStatus.failure));
          }
        }else{
          return emit(state.copyWith(status: PopularStatus.failure));
        }
      }else{
        ///
        page++;
        final model = await RemoteDataSource().getMoviePopular(page);
        if(model != null){
          final list = model.results;
          if(list != null){
            list.isEmpty ? emit(state.copyWith(hasReachedMax: true)) : emit(state.copyWith(status: PopularStatus.success, list: List.of(state.list)..addAll(list), hasReachedMax: false));
          }else{
            return emit(state.copyWith(status: PopularStatus.failure));
          }
        }else{
          return emit(state.copyWith(status: PopularStatus.failure));
        }
      }
    }catch (e){
      emit(state.copyWith(status: PopularStatus.failure));
    }
  }
}