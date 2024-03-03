import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
            height: 13,
          ),
          Text(
            "STEP 1",
            style: TextStyle(
                fontSize: 11,
                fontFamily: MyAssetsStrings.productsanslight),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Payment",
            style: TextStyle(
                fontSize: 25,
                fontFamily: MyAssetsStrings.productSans),),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 94.1, // Set the desired width
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          MyAssetsStrings.money_icon,
                          width: 36.49,
                          height: 22,
                        ),
                        Text(
                        "Cash"  ,
                        style: TextStyle(
                        fontSize: 12,
                        fontFamily: MyAssetsStrings
                            .productSansMedium,
                        fontWeight: FontWeight.bold,
                        color:
                        MyColor.cash_text_color),
                  ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 94.1, // Set the desired width
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            MyAssetsStrings.card_icon,
                            width: 35,
                            height: 42,
                          ),
                        ),
                        Text(
                          "Credit Card"  ,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: MyAssetsStrings
                                  .productSansMedium,
                              fontWeight: FontWeight.bold,
                              color:
                              MyColor.cash_text_color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


            ],),
        ),
      ),
    );
  }
}
