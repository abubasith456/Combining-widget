// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function(String) deleteTransaction;

  TransactionList(this.transaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text('No transaction yet!',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('${transaction[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transaction[index].date)),
                  trailing: MediaQuery.of(context).size.width > 450
                      ? FlatButton.icon(
                          onPressed: () => deleteTransaction(
                              transaction[index].id as String),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          color: Theme.of(context).errorColor,
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              deleteTransaction(transaction[index].id),
                        ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
