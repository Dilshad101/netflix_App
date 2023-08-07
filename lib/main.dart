import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/Pages/parant_screen.dart';
import 'package:netflix_app/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, 
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansDevanagariTextTheme().copyWith(
          bodyLarge: const TextStyle(color: whiteCl),
          bodyMedium: const TextStyle(color: whiteCl),
          bodySmall: const TextStyle(color: whiteCl),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: blackCl),
        scaffoldBackgroundColor: blackCl,
      ),
      themeMode: ThemeMode.dark,
      home: ScreenParent(),
    );
  }
}
