
import 'package:flutter/cupertino.dart';

import '../constants/page_constant.dart';
import '../presentation/ui/home/home_screen_bloc.dart';

class Routes{
  static Map<String, WidgetBuilder> getRoute(){
    return <String, WidgetBuilder>{
      PageConstant.homeScreen: (_) => const PopularScreenBloc(),
    };
  }
}