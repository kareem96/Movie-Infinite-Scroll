

part of 'popular_bloc.dart';
enum PopularStatus {initial, success, failure}

class PopularState extends Equatable{
  final List<Movie> list;
  final bool hasReachedMax;
  final PopularStatus status;

  const PopularState({
  this.list = const<Movie>[],
  this.status = PopularStatus.initial,
  this.hasReachedMax = false,
  });

  PopularState copyWith({
    List<Movie>? list,
    bool? hasReachedMax,
    PopularStatus? status,
    int? total
  }){
    return PopularState(
      list: list ?? this.list,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      status: status ?? this.status
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [list, hasReachedMax];
}