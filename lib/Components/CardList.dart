import 'package:balderrama1149/Components/CardView.dart';
import 'package:flutter/material.dart';

import '../Model/CardModel.dart';
import '../Pages/CardViewPage.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: getChaildrenCards(context));
  }

  List<Widget> getChaildrenCards(context) {
    return cards
        .map((card) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardViewPage(card: card)));
              },
              child: CardView(card),
            ))
        .toList();
  }
}
