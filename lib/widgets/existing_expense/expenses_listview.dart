import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_section_5/provider/expense_provider.dart';
import 'package:flutter_section_5/widgets/existing_expense/expense_item.dart';

import '../../models/expense.dart';

class ExpensesListView extends ConsumerWidget {
  const ExpensesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Expense> expenses = ref.watch(expenseNotifierProvider);

    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) {
          return Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(255, 247, 116, 107)),
              ),
              onDismissed: ((direction) {
                ref
                    .read(expenseNotifierProvider.notifier)
                    .deleteExpense(expenses[index]);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Expense is deleted successfully'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      ref
                          .read(expenseNotifierProvider.notifier)
                          .restoreExpense(index, expenses[index]);
                    },
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ));
              }),
              child: ExpenseItem(expense: expenses[index]));
        }));
  }
}
