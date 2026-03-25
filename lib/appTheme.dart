import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  //COLORS
  static const Color primaryRed = Color(0xFFD32F2F);
  static const Color inputText  = Colors.black;
  static const Color labelText  = Colors.black54;
  static const Color buttonText = Colors.white;
  static const Color appBarText = Colors.white;

  //FONT SIZES
  static const double titleSize  = 30;
  static const double appBarSize = 24;
  static const double buttonSize = 16;
  static const double subtitleSize = 16;
  static const double labelSize  = 14;

  //BORDER RADIUS
  static const double inputRadius  = 40;
  static const double cardRadius   = 25;

  //TEXT STYLES
  static TextStyle titleStyle = GoogleFonts.publicSans(
    fontSize: titleSize,
    fontWeight: FontWeight.bold,
    color: primaryRed,
  );

  static TextStyle brandStyle = GoogleFonts.publicSans(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle tileStyle = GoogleFonts.publicSans(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: labelText,
  );
  static TextStyle welcomeStyle = GoogleFonts.publicSans(
    fontSize: 55,
    fontWeight: FontWeight.bold,
    color: primaryRed,
  );
  static TextStyle signUpStyle = GoogleFonts.publicSans(
    fontSize: 15,
    color: primaryRed,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: primaryRed,
  );
  static TextStyle subtitleStyle = GoogleFonts.publicSans(
    fontSize: subtitleSize,
    fontWeight: FontWeight.w500,
    color: primaryRed,
  );
  static TextStyle appBarStyle = GoogleFonts.publicSans(
    fontSize: appBarSize,
    fontWeight: FontWeight.bold,
    color: appBarText,
  );

  static TextStyle inputStyle = GoogleFonts.publicSans(
    fontSize: labelSize,
    color: inputText,
  );

  static TextStyle labelStyle = GoogleFonts.publicSans(
    fontSize: labelSize,
    color: labelText,
  );

  static TextStyle buttonStyle = GoogleFonts.publicSans(
    fontSize: buttonSize,
    fontWeight: FontWeight.w500,
    color: buttonText,
  );

  static TextStyle hintStyle = GoogleFonts.publicSans(
    fontSize: labelSize,
    color: labelText,
  );

  //GRADIENT
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF8B0000),
      Color(0xFFB71C1C),
      Color(0xFFD32F2F),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  //INPUT BORDER
  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: primaryRed),
    borderRadius: BorderRadius.all(Radius.circular(inputRadius)),
  );

  //BUTTON STYLE
  static ButtonStyle elevatedButtonStyle = ButtonStyle(
    elevation: WidgetStatePropertyAll(10),
    backgroundColor: WidgetStatePropertyAll(primaryRed),
    fixedSize: WidgetStatePropertyAll(Size(100, 20)),
  );
}