import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          leading: Positioned(
            top: 0,
            left: 0,
            child: Container(
                decoration: BoxDecoration(
                  color: Color(int.parse(MyColor.myColorOne)),
                  borderRadius: BorderRadius.circular(70.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.4), // Set the shadow color
                      spreadRadius: 2, // Set the spread radius of the shadow
                      blurRadius: 5, // Set the blur radius of the shadow
                      offset: Offset(0, 1), // Set the offset of the shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(5.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
          ),
          title: Text('Add To Cart',
              style: TextStyle(
                fontFamily: MyAssetsStrings.productSans,
                fontSize: 20,
                color: Color(int.parse(MyColor.myColorTwo)),
              )),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      MyAssetsStrings.office_tshirt,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sportswear Set"),
                  Text("\$ 80.00"),
                  Text("Size:L | Color : Cream")
                ],
              ),
              Column(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      Text("2"),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.minimize_rounded)),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
