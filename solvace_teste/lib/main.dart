import 'package:flutter/material.dart';
import 'package:solvace_teste/src/initial/login.dart';
import 'package:solvace_teste/src/shared/helpers/color_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solvace Teste',
      debugShowCheckedModeBanner: false,
      theme: _buildThemeData(ColorLib.colorPrimary.hex),
      home: LoginPage(),
    );
  }

  _buildThemeData(String primaryColor) {
    return ThemeData(
      // NOTE font
        fontFamily: 'Inter',
        // NOTE cor brackground
        scaffoldBackgroundColor: Colors.white,
        // NOTE color BottomNavigation
        canvasColor: Colors.white,
        // NOTE primary color
        primaryColor: primaryColor.color,
        accentColor: Colors.white,
        //brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // NOTE AppBarDefatul

        appBarTheme: AppBarTheme(
          color: Colors.green,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ));
  }
}
