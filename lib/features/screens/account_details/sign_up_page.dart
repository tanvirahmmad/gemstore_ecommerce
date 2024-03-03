import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 63,
                    width: 163,
                    child: Text(
                      "Create\nyour Account",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: MyAssetsStrings.productSans,
                      ),
                    ),
                  ),

                  TextField(
                    decoration: InputDecoration(labelText: 'Enter your name'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email address'),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Confirm password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    height: 51,
                    width: 147,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown.shade500,
                        side: const BorderSide(color: Colors.white, width: 1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                      onPressed: () {
                        MyRoutes.NavigateToNavigationBar(context);
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontFamily: MyAssetsStrings.productSans,
                          color: Color(int.parse(MyColor.myColorOne)),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(child: Text("or sign up with")),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Add your Apple login logic here
                          },
                          icon: Icon(Icons.apple),
                          color: Colors.black,
                          iconSize: 40,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Add your Google login logic here
                          },
                          icon: Icon(Icons.favorite),
                          color: Colors.black,
                          iconSize: 40,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            // Add your Facebook login logic here
                          },
                          icon: Icon(Icons.facebook),
                          color: Colors.black,
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          // Add your login navigation logic here
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
