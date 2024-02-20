import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/features/screens/product_details_screen.dart';
import 'package:gemstore_ecommerce/features/screens/search_screen/search_screen.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/SplashScreen.dart';

class Gemstore extends StatelessWidget {
  const Gemstore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemstore',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductDetailsScreen(),
    );
  }
}

