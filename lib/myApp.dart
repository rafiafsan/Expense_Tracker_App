import 'package:flutter/material.dart';
import 'expensetracker.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.grey,
          centerTitle: true,
        ),

      ),
      title: "First App",
      home: ExpenseTracker(),
    );
  }
}