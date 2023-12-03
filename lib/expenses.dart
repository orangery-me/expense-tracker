import 'package:flutter/material.dart';
import 'package:flutter_section_5/widgets/existing_expense/expenses_listview.dart';
import 'package:flutter_section_5/models/expense.dart';
import 'package:flutter_section_5/widgets/new_expense_sheet/new_expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses>{
  final List <Expense> _expenses = [
      Expense(
        title: 'Flour to make cake',
        amount: 8.99,
        date: DateTime.utc(2023, 11, 30),
        category: Category.food), 
      Expense(
        title: 'Flutter course',
        amount: 346.5,
        date: DateTime.utc(2023, 11, 20),
        category: Category.learn), 
      Expense(
        title: 'Cinema',
        amount: 16.5,
        date: DateTime.utc(2023, 11, 29),
        category: Category.leisure), 
      Expense(
        title: 'Gas',
        amount: 20.0,
        date: DateTime.now(),
        category: Category.transportation), 
    ];

  void _addNewExpense(Expense expense){
    setState(() {
      _expenses.add(expense);
    });
  }
  
  void _openAddExpenseWindow(){
    showModalBottomSheet(context: context,
      builder: (ctx){
        return NewExpense(_addNewExpense);
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseWindow,
            icon: const Icon(
              Icons.add_sharp
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The chart!'),
          Expanded(
            child: ExpensesListView(expenses: _expenses)
          )
        ],
      ),
    );
  }

}