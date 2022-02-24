import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) addText;

  NewTransaction(this.addText);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickedDate;

  void submitData() {
    final titleText = _titleController.text;
    final amountText = double.parse(_amountController.text);

    if (titleText.isEmpty || amountText <= 0 || _pickedDate == null) {
      return;
    }

    widget.addText(
      _titleController.text,
      double.parse(_amountController.text),
      _pickedDate!,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicer() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _pickedDate = value;
      });

      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _pickedDate == null
                        ? 'Date not choosen!'
                        : 'Picked date: ${DateFormat.yMd().format(_pickedDate!)}',
                  ),
                  FlatButton(
                    onPressed: _presentDatePicer,
                    child: Text(
                      'Pick date',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => submitData(),
                child: const Text('Start transfer'))
          ]),
        ),
      ),
    );
  }
}
