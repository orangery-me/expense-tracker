import 'package:flutter/material.dart';
import 'package:flutter_section_5/widgets/chart/chart.dart';
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
      Expense(
        title: 'Coke',
        amount: 10.0,
        date: DateTime.now(),
        category: Category.food), 
    ];

  void _addNewExpense(Expense expense){
    setState(() {
      _expenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense){
    final index= _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense is deleted successfully'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(index, expense);
            });
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      )
    );
  }

  void _openAddExpenseWindow(){
    showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder: (ctx){
        return NewExpense(_addNewExpense);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('It\'s time to track your expenses!'),
    );

    if (_expenses.isNotEmpty){
      mainContent = ExpensesListView(
              expenses: _expenses, onRemoveExpense: _deleteExpense);
    }

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            Chart(expenses: _expenses),
            Expanded(
              child: mainContent
            )
          ],
        ),
      ),
    );
  }

}