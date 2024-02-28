import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';

class ProductCard extends StatefulWidget {
  final Product product;
   ProductCard( {super.key, required this.product,});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container(
                height:206,


                decoration: BoxDecoration(

                ),
                child:
                    ClipRRect(borderRadius: BorderRadius.circular(12),
                      child: Image.network(widget.product.thumbnail!,
fit: BoxFit.fill,
                   // Adjust the height of the logo image
                      ),
                    ),),
            ),
SizedBox(height: 10,),
        Container(
     // Set the maximum width for the text
        child: Text(widget.product.name!,
        maxLines: 2, // Set the maximum number of lines
        overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
        style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
        ),),

SizedBox(height: 8,),
                  Text(
                    "9088",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
      ),
    );

  }}










      /*
        Container(

          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(widget.product.thumbnail!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(widget.product.name!, style: TextStyle(fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: MyAssetsStrings.productSansMedium
        )),
        Text("jh"),
      ],
    );
  }
}
*/

