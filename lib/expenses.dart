import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_section_5/widgets/chart/chart.dart';
import 'package:flutter_section_5/widgets/existing_expense/expenses_listview.dart';
import 'package:flutter_section_5/models/expense.dart';
import 'package:flutter_section_5/widgets/new_expense_sheet/new_expense.dart';
import 'package:flutter_section_5/provider/expense_provider.dart';

class Expenses extends ConsumerStatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  ConsumerState<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends ConsumerState<Expenses> {
  void _openAddExpenseWindow() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    final List<Expense> expenses = ref.watch(expenseNotifierProvider);

    Widget mainContent = const Center(
      child: Text('It\'s time to track your expenses!'),
    );

    if (expenses.isNotEmpty) {
      mainContent = const ExpensesListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseWindow,
            icon: const Icon(Icons.add_sharp),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Chart(expenses)),
            Expanded(flex: 3, child: mainContent)
          ],
        ),
      ),
    );
  }
}
