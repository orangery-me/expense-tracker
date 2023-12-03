import 'package:flutter/material.dart';
import 'package:flutter_section_5/widgets/existing_expense/expense_item.dart';

import '../../models/expense.dart';

class ExpensesListView extends StatelessWidget {

  final List <Expense> expenses;

  const ExpensesListView({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) {
        return ExpenseItem(expense: expenses[index]);
      })
    );
  }
  
}