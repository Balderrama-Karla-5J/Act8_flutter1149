// ignore: file_names
import 'package:flutter/material.dart';
import 'package:balderrama1149/Model/TransactionModel.dart';

class TransactionView extends StatefulWidget {
  final TransactionModel transaction;

  const TransactionView({super.key, required this.transaction});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              widget.transaction.type == "-"
                  ? Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                    ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.transaction.name.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.transaction.type.toString() +
                    widget.transaction.price.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                widget.transaction.currency.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
