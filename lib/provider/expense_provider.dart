import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_section_5/data/data.dart';

import '../models/expense.dart';

class ExpenseNotifier extends Notifier<List<Expense>> {
  @override
  List<Expense> build() {
    return existingExpenses;
  }

  void addNewExpense(Expense expense) {
    state = [...state, expense];
  }

  void restoreExpense(int index, Expense expense) {
    List<Expense> temp = [];
    for (int i = 0; i < index; ++i) {
      temp.add(state[i]);
    }
    temp.add(expense);
    for (int i = index; i < state.length; ++i) {
      temp.add(state[i]);
    }
    state = temp;
  }

  void deleteExpense(Expense expense) {
    state = state.where((element) => element.id != expense.id).toList();
  }
}

final expenseNotifierProvider =
    NotifierProvider<ExpenseNotifier, List<Expense>>(() => ExpenseNotifier());
