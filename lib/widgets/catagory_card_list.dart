import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CatagoriesCardList extends StatelessWidget {
  final String? catagoryimage;

  const CatagoriesCardList(
      {super.key, required this.catagoryimage});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
            child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.network(
              catagoryimage!,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,

            ),
          ),
        )));
  }
}
