// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widget/transaction_item.dart';

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
              return TransactionItem(
                  transaction: transaction[index],
                  deleteTransaction: deleteTransaction);
            },
            itemCount: transaction.length,
          );
  }
}




// TransactionItem(
//                   transaction: transaction[index],
//                   deleteTransaction: deleteTransaction);
//             },
