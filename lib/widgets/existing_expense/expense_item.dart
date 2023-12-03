import 'package:flutter/material.dart';
import 'package:flutter_section_5/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  final Expense expense;

  const ExpenseItem({required this.expense ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Icon(categoryIcons[ expense.category ]),
                  const SizedBox(width: 8.0),
                  Text(expense.formattedDate)
                ],
              )
            ],
          ),
        ),
    );
  }

}