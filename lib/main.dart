import 'package:flutter/material.dart';
import 'package:untitled5/category/category_deatils.dart';
import 'package:untitled5/Home/home_screen.dart';
import 'package:untitled5/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        theme: MyTheme.lightTheme,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
        });
  }
}
