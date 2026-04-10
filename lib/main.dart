
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SplashScreen.dart';
import 'appTheme.dart';

// main() must be async because Firebase initialization
// takes time — like an async function in C++ that waits
// for a resource to be ready before continuing
void main() async {

  // ensures Flutter is fully initialized before
  // Firebase tries to start — like calling init()
  // before using any library in C++
  WidgetsFlutterBinding.ensureInitialized();

  // waits for Firebase to fully connect before
  // running the app — like await in C++20 coroutines
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCqWm7WS_uXGtkEXXqpI4hQQPOdMer3EI4",
        authDomain: "hemoaid-88cd7.firebaseapp.com",
        projectId: "hemoaid-88cd7",
        storageBucket: "hemoaid-88cd7.firebasestorage.app",
        messagingSenderId: "481806887841",
        appId: "1:481806887841:web:e12e7342290a36290679e0"
    ),
  );

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
        ),
      ),
      home: const SplashScreen(),
    );
  }
}