import '../models/expense.dart';

final List<Expense> existingExpenses = [
  Expense(
      title: 'Flour to make cake',
      amount: 19.99,
      date: DateTime.utc(2023, 11, 30),
      category: Category.food),
  Expense(
      title: 'Flutter course',
      amount: 346.5,
      date: DateTime.utc(2023, 11, 20),
      category: Category.learn),
  Expense(
      title: 'Cinema',
      amount: 77.5,
      date: DateTime.utc(2023, 11, 29),
      category: Category.leisure),
  Expense(
      title: 'Gas',
      amount: 281.0,
      date: DateTime.now(),
      category: Category.transportation),
  Expense(
      title: 'Coke',
      amount: 145.5,
      date: DateTime.now(),
      category: Category.food),
];
