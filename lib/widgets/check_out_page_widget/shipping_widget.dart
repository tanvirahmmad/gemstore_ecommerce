import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';

class ShippingWidget extends StatefulWidget {
  const ShippingWidget({super.key});

  @override
  State<ShippingWidget> createState() => _ShippingWidgetState();
}

class _ShippingWidgetState extends State<ShippingWidget> {
  String selectRadio = "option 1";
  bool isChecked = false;
  RadioButtonChanged(String value) {
    setState(() {
      selectRadio = value;
    });
  }

  checkedButtonChanged(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        "Shipping",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: MyAssetsStrings.productSans),
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: 'First name *'),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: 'Last name *'),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: 'Country *'),
                        obscureText: false,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: 'City *'),
                        obscureText: false,
                      ),
                      SizedBox(height: 8),
                      TextField(

                        keyboardType: TextInputType.name,
                        decoration:
                            InputDecoration(labelText: 'State / Province *'),
                        obscureText: false,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Zip-code *'),
                        obscureText: false,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Phone number *'),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Shipping method",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: MyAssetsStrings.productSans,
                            color: MyColor.coupon_code_color,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Colors.teal,
                                      value: "option 1",
                                      groupValue: selectRadio,
                                      onChanged: (value) =>
                                          RadioButtonChanged(value!),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Free   ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: MyAssetsStrings
                                                    .productSansMedium,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    MyColor.radio_text2_color),
                                          ),
                                          TextSpan(
                                              text: 'Delivery to home',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: MyAssetsStrings
                                                    .productSansMedium,
                                                color:
                                                    MyColor.radio_text1_color,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Text(
                                      'Delivery from to 3 to 7 Business days ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:
                                            MyAssetsStrings.productsanslight,
                                        color: MyColor.radio_text3_color,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Colors.teal,
                                      value: "option 2",
                                      groupValue: selectRadio,
                                      onChanged: (value) =>
                                          RadioButtonChanged(value!),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '\$ 9.90   ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: MyAssetsStrings
                                                    .productSansMedium,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    MyColor.radio_text2_color),
                                          ),
                                          TextSpan(
                                              text: 'Delivery to home',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: MyAssetsStrings
                                                    .productSansMedium,
                                                color:
                                                    MyColor.radio_text1_color,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Text(
                                      'Delivery from to 4 to 6 Business days ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily:
                                            MyAssetsStrings.productsanslight,
                                        color: MyColor.radio_text3_color,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: Colors.teal,
                                      value: "option 3",
                                      groupValue: selectRadio,
                                      onChanged: (value) =>
                                          RadioButtonChanged(value!),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: '\$ 9.90',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: MyAssetsStrings
                                                    .productSansMedium,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    MyColor.radio_text2_color),
                                          ),
                                          TextSpan(
                                              text: '   Fast Delivery',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: MyAssetsStrings
                                                    .productSansMedium,
                                                color:
                                                    MyColor.radio_text1_color,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Text(
                                      'Delivery from to 2 to 3 Business days ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        fontFamily:
                                            MyAssetsStrings.productsanslight,
                                        color: MyColor.radio_text3_color,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Coupon Code",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: MyAssetsStrings.productSans,
                                color: MyColor.coupon_code_color,
                              )),
                          SizedBox(
                            height: 30,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: TextField(
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  suffixIcon: TextButton(
                                    onPressed: () {
                                      // Handle button press here
                                    },
                                    child: Text(
                                      'Validate',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        fontFamily:
                                            MyAssetsStrings.productSansMedium,
                                        color: MyColor.rattingbar_icon_color,
                                      ),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: MyColor.text_field_color,
                                  hintText: 'Have a code?type it here...',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    fontFamily:
                                        MyAssetsStrings.productsanslight,
                                    color: MyColor.radio_text3_color,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  // Add other styling properties as needed
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Text("Billing Address",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: MyAssetsStrings.productSans,
                                color: MyColor.coupon_code_color,
                              )),
                          SizedBox(
                            height: 18,
                          ),

                          Row(
                            children: [
                              Checkbox(

                                fillColor: MaterialStateProperty.all<Color>(
                                    Colors.green),
                                value:
                                    isChecked, // Set the initial value of the checkbox
                                onChanged: (value) =>
                                    checkedButtonChanged(value!),
                              ),
                              // Add spacing between the ceckbox and text
                              Text('Copy address data from shipping',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        MyAssetsStrings.productSansMedium,
                                    color: MyColor.copy_address_color,
                                  )),
                            ],
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: 55,
                              width: 312,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: MyColor.continue_to_payment_color,
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Continue to payment",
                                  style: TextStyle(
                                    fontFamily: MyAssetsStrings.productSans,
                                    color: Color(int.parse(MyColor.myColorOne)),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                    ]))));
  }
}
