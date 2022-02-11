


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_scroll/presentation/ui/home/popular_screen.dart';

import '../../../data/bloc/popular_bloc.dart';

class PopularScreenBloc extends StatelessWidget {
  const PopularScreenBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PopularBloc()..add(PopularEventInit()),
        child: const PopularScreen(),
      ),
    );
  }
}
