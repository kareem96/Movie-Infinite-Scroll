


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_scroll/data/bloc/popular_bloc.dart';
import 'package:flutter_infinite_scroll/data/model/movie_model.dart';

import '../custom_widgets/custom_card.dart';
import '../custom_widgets/custom_view_movie.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final ScrollController _scrollController = ScrollController();

  bool get _isBottom {
   if(!_scrollController.hasClients) return false;
   final maxScroll = _scrollController.position.maxScrollExtent;
   final currentScroll = _scrollController.offset;
   return currentScroll >= (maxScroll * 0.9);
  }
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_onScroll);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController
    ..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        switch (state.status){
          case PopularStatus.failure:
            return const Center(child: Text('Failure'),);
          case PopularStatus.success:
            if(state.list.isEmpty){
              return const Center(child: Text('Not Found'),);
            }else{
              return _home(state.list);
            }
          default:
            return  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 10,),
                Text('Loading...')
              ],
            ),);
        }
      },
    );
  }

  void _onScroll() {
    if(_isBottom) context.read<PopularBloc>().add(PopularEventInit());
  }

  Widget _home(List<Movie> modelList) {
    final itemCount = modelList.length;
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverAppBar(
          expandedHeight: 40,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Movie infinite scroll', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, i){
            final result = modelList[i];
            return _card(result);
          },
            childCount: itemCount),
        )
      ],
    );
  }

  void _onTap(Movie movie) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return CustomViewMovie(movie: movie);
        }));
  }

  Widget _card(Movie movie) {
    return CustomCard(movie, (value){
      _onTap(value);
    });
  }
}
