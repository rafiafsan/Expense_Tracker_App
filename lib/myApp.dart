import 'package:flutter/material.dart';
import 'expensetracker.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.green,
          centerTitle: true,
        ),scaffoldBackgroundColor: Colors.white,

      ),
      title: "First App",
      home: ExpenseTracker(),
    );
  }
}