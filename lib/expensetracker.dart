import 'package:flutter/material.dart';

import 'model/expense.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _expense = [];
  final List<String> _category = [
    'Food',
    'Transport',
    'Entertainment',
    'Bills'
  ];
  double _toal = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total: \$${_toal}",style: TextStyle(fontSize: 25),),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){},child: Icon(Icons.add),),
    );
  }
}
