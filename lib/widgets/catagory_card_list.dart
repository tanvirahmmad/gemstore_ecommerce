import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CatagoriesCardList extends StatelessWidget {
  final String? image;
  final String? text;
 const CatagoriesCardList({super.key,required this.image,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(3, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.network("https://fluxstore.bengalquiz.xyz/uploads/categories/${image}"),
              ),
          // AssetImage(image!),

          Container( child:Text(text!, style: TextStyle(),))

        ],

      ),
    );
  }
}