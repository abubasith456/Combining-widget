import 'package:flutter/material.dart';
import '../widget/new_trnsaction.dart';
import '../widget/transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Mobile',
      amount: 30000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Laptop',
      amount: 80000,
      date: DateTime.now(),
    ),
  ];

  void _addNewtransaction(String textTitle, double textAmount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: textTitle,
        amount: textAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewtransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
