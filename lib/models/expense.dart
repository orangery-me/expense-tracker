import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid =  Uuid();
final formatter = DateFormat('EEE, d/M/y');

enum Category {food, leisure, transportation, learn }

const categoryIcons = {
  Category.food : Icons.fastfood,
  Category.leisure : Icons.movie,
  Category.transportation : Icons.pedal_bike,
  Category.learn : Icons.library_books

};
 
 class Expense{
  Expense({
    required this.title,
    required this.amount, 
    required this.date,
    required this.category})
    : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; 

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket{
  final Category category;
  final List<Expense> bucket;

  ExpenseBucket({ required this.category, required this.bucket});

  ExpenseBucket.byCategory({ required List <Expense> allExpense, required this.category})
  : bucket = allExpense.where((element) => element.category == category).toList();

  double get total{
    double sum = 0;

    for (final item in bucket){
      sum+= item.amount;
    }
    return sum;
  }
}