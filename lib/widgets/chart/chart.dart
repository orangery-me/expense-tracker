import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Expense> expenses;
  const Chart(this.expenses, {Key? key}) : super(key: key);

  List <ExpenseBucket> get expenseBucket{
    List <ExpenseBucket> result = [];
    for (var item in Category.values){
      result.add( ExpenseBucket.byCategory(allExpense: expenses, category: item) );
    }
    return result;
  }
  
  double get maxExpenseBucket{
    double max = 0;
    for (var item in expenseBucket){
      if (item.total > max){
        max = item.total;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.4),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...expenseBucket.map(
            (e) {
              if (maxExpenseBucket != 0){
                return ChartBar(e.total/maxExpenseBucket, iconData: categoryIcons[e.category]!);
              }
              else{
                return const SizedBox();
              }
            }
          ),
        ],
      ),
    );
  }

}