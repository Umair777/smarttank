import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smarttank/dashboard.dart';
import 'dart:math' as math;
//import 'package:flutter/GoogleFonts';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'WorkSans'
          // fontFamily: GoogleFonts.lato().fontFamily,
          ),
      // home: const Dashboard()
      routes: {
        "/": (context) => Dashboard(),
      },
    );
  }
}
