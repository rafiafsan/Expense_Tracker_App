import 'package:flutter/foundation.dart';
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
  double _total = 0.0;

  void _addExpense(String title, double amount, DateTime date, String category){
    setState(() {
      _expense.add(Expense(title: title, amount: amount, date: date, category: category));
      _total+=amount;
    });
  }

  void _showForm(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController amountcontroller = TextEditingController();

    String selectedCategory = _category.first;
    DateTime selectedDate = DateTime.now();

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titlecontroller,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: amountcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  items: _category
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category)))
                      .toList(),
                  onChanged: (value) => selectedCategory = value!,
                  decoration: InputDecoration(labelText: "Category"),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if(titlecontroller.text.isEmpty || double.tryParse(amountcontroller.text)==null){
                            _addExpense(titlecontroller.text, double.parse(amountcontroller.text), selectedDate , selectedCategory);
                            return;
                          }
                          titlecontroller.clear();
                          amountcontroller.clear();
                          Navigator.pop(context);
                        }, child: Text("Add Expense"))),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker App',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () => _showForm(context), icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Card(
              margin: EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total: \$${_total}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _expense.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(_expense[index].category),
                      ),
                      title: Text(_expense[index].title),
                      subtitle: Text(_expense[index].date.toString()),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
