import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function(String, double) addText;

  NewTransaction(this.addText);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
          ),
          FlatButton(
              onPressed: () => {
                    addText(titleController.text,
                        double.parse(amountController.text))
                  },
              child: const Text(
                'Start transfer',
                style: TextStyle(color: Colors.blue),
              ))
        ]),
      ),
    );
  }
}
