import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/add_to_cart.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/category_bloc/category_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/get_all_products_bloc/get_all_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_screen.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/SplashScreen.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/category_repository.dart';
import 'package:gemstore_ecommerce/repository/get_tag_products.dart';
import 'package:gemstore_ecommerce/widgets/details_screen.dart';
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
          /*
          BlocProvider(
            create: (context) =>
                ShreesProductsBloc(ShareesProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => TopsProductsBloc(TopsProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => CoordsProductsBloc(CoordsProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => SkirtsProductsBloc(SkirtsProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => JeansProductsBloc(JeansProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => SportsProductsBloc(SportsProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => FlatsProductsBloc(FlatsProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => HeelsProductsBloc(HeelsProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) =>
                SkinCareProductsBloc(SkinCareProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => ShoesProductsBloc(ShoesProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) =>
                PerfumeProductsBloc(PerfumeProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => MakeupProductsBloc(MakeupProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) =>
                JewelleryProductsBloc(JewelleryProductsRepository()),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => CasualProductsBloc(CasualProductsRepository()),
            lazy: true,
          ),*/
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gemstore',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: AddToCart(),
        ),
      ),
    );
  }
}
