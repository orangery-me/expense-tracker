import 'package:flutter/material.dart';
import 'package:flutter_section_5/models/expense.dart';

class ChartBar extends StatelessWidget {
  final double fillRatio;
  final IconData iconData;
  const ChartBar(this.fillRatio, { required this.iconData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            flex: 5,
            child: FractionallySizedBox(
              heightFactor: fillRatio,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.65),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Flexible(
            flex: 1,
            child: Icon(iconData),
          ),
        ],
      ),
    );
  }
}