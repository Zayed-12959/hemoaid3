import 'package:flutter/material.dart';
import 'package:hemoaid/splashScreen.dart';
import 'package:hemoaid/welcome.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black,
        ), //for black cursor
      ),
      home: SplashScreen(),
    );
  }
}