import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/expense.dart' as expense;

class NewExpense extends StatefulWidget{
  final void Function(expense.Expense) onAddExpense;

  const NewExpense(this.onAddExpense,{super.key}) ;

  @override
  State<NewExpense> createState() {
      return _NewExpenseState();
  }

}
class _NewExpenseState extends State<NewExpense>{
  final _titleController =  TextEditingController();
  final _amountController = TextEditingController() ;
  DateTime? _selectedDate;
  final _formatter = DateFormat('EEE, d/M/y');
  var _selectedCategory = expense.Category.food;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _showDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime.utc(2000,1,1);
    final lastDate = DateTime.utc(2100,1,1);
    final datePicker = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate
    );

    setState(() {
      _selectedDate = datePicker;
    });
  }

  void _isValid(){
    final amount = double.tryParse(_amountController.text);

    if (_titleController.text.trim().isEmpty || amount == null || amount<0 || _selectedDate == null){
      showDialog(
          context: context,
          builder: ((context) { 
            return AlertDialog(
              title: const Text('Invalid input'),
              content: const Text('Please type a valid title or amount'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Oke'))
              ],
            );
          })
      );
      return ;
    }
    else{
      widget.onAddExpense( expense.Expense(
        title: _titleController.text, 
        amount: amount, 
        date: _selectedDate!, 
        category: _selectedCategory)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextField(
            controller: _titleController,
            autocorrect: false,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount')),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      (_selectedDate == null) ? 'Select Date': _formatter.format(_selectedDate!),
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    IconButton(
                      onPressed: _showDatePicker, 
                      icon: const Icon(Icons.calendar_month)
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0,),
          Row(
            children: [
              const Text('Category: ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(179, 55, 55, 55)
                ),
              ),
              const SizedBox(width: 8.0,),
              DropdownButton(
                value: _selectedCategory,
                items: expense.Category.values
                  .map(
                      (item) => DropdownMenuItem(
                        // the value to return
                        value: item,
                        // the thing (text) that menu item will show
                        child: Text(item.name.toUpperCase())
                      )
                  ).toList(),
                onChanged: (value){
                  if (value == null){
                    return;
                  }
                  setState(() {
                    _selectedCategory = value as expense.Category;
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                    _isValid();
                    Navigator.pop(context);
                  
                }, 
                child: const Text('Done')
              ),
              const SizedBox(width: 10.0),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text('Cancel')
              )
            ],
          )
        ],
        ),
      );
  }

}