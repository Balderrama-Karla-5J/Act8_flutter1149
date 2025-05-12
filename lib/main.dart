import 'dart:html';
import 'dart:js';

import 'package:balderrama1149/Components/CardView.dart';
import 'package:balderrama1149/Model/CardModel.dart';
import 'package:balderrama1149/Model/TransactionModel.dart';
import 'package:balderrama1149/Model/TransactionView.dart';
import 'package:balderrama1149/Pages/AddCardPage.dart';
import 'package:balderrama1149/Providers/CardProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Components/CardList.dart';

void main() => runApp(ChangeNotifierProvider<CardProvider>(
      create: (context) => CardProvider(),
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: HomePage(),
      ),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CardProvider>(context).initialState();
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text("Home Page", style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        centerTitle: true,
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCardPage()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, child) => CardList(
                          cards: cards.allCards,
                        ),
                      ),

                      //CardView(CardModel(available: 1000, currency: 'US',name: 'Mastercard',number: '1234 **** **** 4321')),
                    )
                  : Container(
                      height: 210,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Add your new card click the \n + \n button in the top right.', //minuto 18:36 ultimo video
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )),
              SizedBox(
                height: 30,
              ),
              Text(
                'Last Transactions',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 15,
              ),
              TransactionView(
                  transaction: TransactionModel(
                      name: 'Shopping',
                      price: 1000,
                      type: '-',
                      currency: 'US')),
              TransactionView(
                  transaction: TransactionModel(
                      name: 'Salary', price: 1000, type: '+', currency: 'US')),
              TransactionView(
                  transaction: TransactionModel(
                      name: 'Receive', price: 2000, type: '+', currency: 'US')),
            ],
          ),
        ),
      ),
    );
  }
}
