import 'package:flutter/material.dart';
import 'package:flutter_section_5/widgets/existing_expense/expense_item.dart';

import '../../models/expense.dart';

class ExpensesListView extends StatelessWidget {

  final List <Expense> expenses;
  final void Function(Expense) onRemoveExpense;
  const ExpensesListView({Key? key, required this.expenses, required this.onRemoveExpense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: ((context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromARGB(255, 247, 116, 107)
            ) ,
          ),
          onDismissed: ((direction) => {
            onRemoveExpense(expenses[index])
          }),
          child: ExpenseItem(expense: expenses[index])
        );
      })
    );
  }
  
}