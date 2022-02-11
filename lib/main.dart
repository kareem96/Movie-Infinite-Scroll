import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/constants/page_constant.dart';
import 'package:flutter_infinite_scroll/utils/routes.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Movie infinite scroll',
            routes: Routes.getRoute(),
            debugShowCheckedModeBanner: false,
            initialRoute: PageConstant.homeScreen,
          );
        },
      )
    );
  }
}

