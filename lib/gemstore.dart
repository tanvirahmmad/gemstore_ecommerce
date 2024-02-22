import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/casual_bloc/casual_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/coords_bloc/coords_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/flats_bloc/flats_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/heels_bloc/heels_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/jewellery_bloc/jewellery_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/makeup_bloc/makeup_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/perfume_bloc/perfume_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/shoes_bloc/shoes_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/skincare_bloc/skin_care_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/skirts_bloc/skirts_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/sports_bloc/sports_products_bloc.dart';
import 'package:gemstore_ecommerce/all_bloc/tops_bloc/tops_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/category_bloc/category_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/sharees_bloc/shrees_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/splash_screen/SplashScreen.dart';
import 'package:gemstore_ecommerce/repository/casual_repository.dart';
import 'package:gemstore_ecommerce/repository/category_repository.dart';
import 'package:gemstore_ecommerce/repository/coords_repository.dart';
import 'package:gemstore_ecommerce/repository/flats_repository.dart';
import 'package:gemstore_ecommerce/repository/heels_repository.dart';
import 'package:gemstore_ecommerce/repository/jeans_repsitory.dart';
import 'package:gemstore_ecommerce/repository/jewellery_repository.dart';
import 'package:gemstore_ecommerce/repository/makeup_repository.dart';
import 'package:gemstore_ecommerce/repository/perfume_repository.dart';
import 'package:gemstore_ecommerce/repository/sharees_reposetory.dart';
import 'package:gemstore_ecommerce/repository/shoes_repository.dart';
import 'package:gemstore_ecommerce/repository/skin_care_repository.dart';
import 'package:gemstore_ecommerce/repository/skirts_repository.dart';
import 'package:gemstore_ecommerce/repository/sports_repository.dart';
import 'package:gemstore_ecommerce/repository/tops_repository.dart';

import 'all_bloc/jeans_bloc/jeans_products_bloc.dart';
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
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gemstore',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
