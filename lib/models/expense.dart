import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid =  Uuid();
final formatter = DateFormat('EEE, d/M/y');

enum Category {food, travel, leisure, work, transportation, investion, rental, learn }

const categoryIcons = {
  Category.food : Icons.fastfood,
  Category.travel: Icons.travel_explore,
  Category.leisure:Icons.movie,
  Category.work : Icons.work,
  Category.transportation : Icons.pedal_bike,
  Category.investion : Icons.integration_instructions,
  Category.rental : Icons.home,
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
