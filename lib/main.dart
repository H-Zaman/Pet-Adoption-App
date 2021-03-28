import 'package:cat_adoption/landingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cat Adoption',
      theme: ThemeData(
        fontFamily: 'Circe',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      home: LandingScreen(),
    );
  }
}
