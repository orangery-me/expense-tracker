import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/expense_provider.dart';
import '../../models/expense.dart' as expense;

class NewExpense extends ConsumerStatefulWidget {
  const NewExpense({super.key});
  @override
  ConsumerState<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends ConsumerState<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  final _formatter = DateFormat('EEE, d/M/y');
  var _selectedCategory = expense.Category.food;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime.utc(2000, 1, 1);
    final lastDate = DateTime.utc(2100, 1, 1);
    final datePicker = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = datePicker;
    });
  }

  void _validate() {
    final amount = double.tryParse(_amountController.text);

    if (_titleController.text.trim().isEmpty ||
        amount == null ||
        amount < 0 ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text('Invalid input'),
              content: const Text(
                  'Please fill out all the fields with valid values'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Oke'))
              ],
            );
          }));
      return;
    } else {
      ref.read(expenseNotifierProvider.notifier).addNewExpense(expense.Expense(
          title: _titleController.text,
          amount: amount,
          date: _selectedDate!,
          category: _selectedCategory));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 52.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'New Expense',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: _titleController,
                autocorrect: false,
                maxLength: 50,
                decoration: const InputDecoration(
                    label:
                        Text('Title', style: TextStyle(color: Colors.white))),
                style: const TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixText: '\$',
                          label: Text('Amount',
                              style: TextStyle(color: Colors.white))),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            (_selectedDate == null)
                                ? 'Select Date'
                                : _formatter.format(_selectedDate!),
                            style: Theme.of(context).textTheme.displaySmall),
                        const SizedBox(width: 4.0),
                        IconButton(
                            onPressed: _showDatePicker,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text('Category: ',
                      style: Theme.of(context).textTheme.displaySmall),
                  const SizedBox(
                    width: 8.0,
                  ),
                  DropdownButton(
                      value: _selectedCategory,
                      items: expense.Category.values
                          .map((item) => DropdownMenuItem(
                              // the value to return
                              value: item,
                              // the thing (text) that menu item will show
                              child: Text(item.name.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall)))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value as expense.Category;
                        });
                      }),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _validate();
                      },
                      child: const Text('Done')),
                  const SizedBox(width: 10.0),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
