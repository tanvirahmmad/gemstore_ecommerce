import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/coords_bloc/coords_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/skirts_bloc/skirts_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/tops_bloc/tops_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/entry_screens/intro_screen_view.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/category_bloc/category_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/sharees_bloc/shrees_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/product_details_screen.dart';
import 'package:gemstore_ecommerce/features/screens/search_screen/search_screen.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/SplashScreen.dart';
import 'package:gemstore_ecommerce/repository/category_repository.dart';
import 'package:gemstore_ecommerce/repository/coords_repository.dart';
import 'package:gemstore_ecommerce/repository/sharees_reposetory.dart';
import 'package:gemstore_ecommerce/repository/skirts_repository.dart';
import 'package:gemstore_ecommerce/repository/tops_repository.dart';

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
                    create: (context) =>
                        ShreesProductsBloc(ShareesProductsRepository()),
                    lazy: true,
                  ),
                      BlocProvider(
                        create: (context) =>
                            TopsProductsBloc(TopsProductsRepository()),
                        lazy: true,
                      ),

                        BlocProvider(
                          create: (context) =>
                              CoordsProductsBloc(CoordsProductsRepository()),
                          lazy: true,
                        ),
                          BlocProvider(
                            create: (context) =>
                                SkirtsProductsBloc(SkirtsProductsRepository()),
                            lazy: true,
                          ),
                        ],
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: 'Gemstore',
                          theme: ThemeData(
                            colorScheme: ColorScheme.fromSeed(
                                seedColor: Colors.deepPurple),
                            useMaterial3: false,
                          ),
                          home: SplashScreen(),
                        ),
                      ),
                    );
  }
}
