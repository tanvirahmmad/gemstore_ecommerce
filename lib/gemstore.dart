import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/category_bloc/category_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/get_all_products_bloc/get_all_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/my_cart.dart';

import 'package:gemstore_ecommerce/features/screens/products_by_catagory/products_by_catagory_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/recommended_bloc/recommended_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/SplashScreen.dart';
import 'package:gemstore_ecommerce/repository/category_repository.dart';
import 'package:gemstore_ecommerce/repository/get_tag_products.dart';
import 'package:gemstore_ecommerce/repository/products_by_catagory_repository.dart';
import 'package:gemstore_ecommerce/repository/recommended_repository.dart';
import 'package:gemstore_ecommerce/widgets/check_out_page_widget/payment_page.dart';
import 'package:gemstore_ecommerce/widgets/check_out_page_widget/shipping_widget.dart';
import 'features/screens/home_screen/features_products/features_products_bloc.dart';
import 'repository/features_products_repository.dart';

class Gemstore extends StatelessWidget {
  const Gemstore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CategoryRepository(),
          lazy: true,
        ),
        RepositoryProvider(
          create: (context) => FeaturesProductsRepository(),
          lazy: true,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc(CategoryRepository()),
          ),
          BlocProvider(
            create: (context) =>
                FeaturesProductsBloc(FeaturesProductsRepository()),
          ),
          BlocProvider(
            create: (context) => GetAllProductsBloc(GetAllProductsRepository()),
          ),
          BlocProvider(
            create: (context) => RecommendedProductsBloc(RecommendedProductsRepository()),
          ),
          BlocProvider(
            create: (context) =>  ProductsByCatagoryBloc(GetProductsByCatagoryReppository()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gemstore',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: Payment(),
        ),
      ),
    );
  }
}
