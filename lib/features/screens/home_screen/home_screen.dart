import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/common/server_urls.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/category_bloc/category_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/get_all_products_bloc/get_all_products_bloc.dart';
import 'package:gemstore_ecommerce/models/category_response.dart';
import 'package:gemstore_ecommerce/widgets/autumn_collection.dart';
import 'package:gemstore_ecommerce/widgets/fetaure_products_slider.dart';
import 'package:gemstore_ecommerce/widgets/heading_showall.dart';
import 'package:gemstore_ecommerce/widgets/hangout_slider_widget.dart';
import 'package:gemstore_ecommerce/widgets/recomended_slider_image.dart';
import 'package:gemstore_ecommerce/widgets/top_collection_sliderone.dart';
import 'package:gemstore_ecommerce/widgets/top_collection_slidertwo.dart';
import 'package:gemstore_ecommerce/widgets/topcollection_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(GetAllCategory());
    context.read<FeaturesProductsBloc>().add(GetFeaturesProducts());
    context.read<GetAllProductsBloc>().add(GetAllProducts());
    super.initState();
  }

  Future<bool> _onWillPop(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop(); // Use SystemNavigator.pop to exit the app
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                    MyStrings.home_page_status,
                    style: TextStyle(
                      fontFamily: MyAssetsStrings.productSans,
                      fontSize: 20,
                      color: Color(int.parse(MyColor.myColorTwo)),
                    ),
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Image.asset(
                  MyAssetsStrings.bell_icon,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                }

                if (state is CategoryLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15)
                        .copyWith(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 109,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...state.categoryResponse.data!
                              .asMap()
                              .entries
                              .map((e) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColor.catagory_icon_color,
                                  ),
                                  child: Image.asset(
                                    MyAssetsStrings.catagoryImage[e.key],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(e.value.name ?? "-"),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                }

                if (state is CategoryError) {
                  return Center(child: Text(state.error));
                }
                return const SizedBox();
              }),

              // BlocBuilder<HomeBannerBloc, HomeState>(
              //     builder: (context, state) {
              //   if (state is BannerLoadingState) {
              //     return const Center(
              //         child: CircularProgressIndicator.adaptive());
              //   } else if (state is BannerLoadedState) {
              //     return SizedBox(
              //       width: double.infinity,
              //       height: 200,
              //       child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: 8,
              //         itemBuilder: (context, index) {
              //           return Padding(
              //               padding: EdgeInsets.only(
              //                   left: 10, right: 10, bottom: 10),
              //               child: Text(
              //                   state.products[index].title!.toString()));
              //         },
              //       ),
              //     );
              //   } else if (state is BannerLoadingErrorState) {
              //     return Center(child: Text(state.ermessege));
              //   }
              //   return const SizedBox();
              // }),
              AutumnCollection(),
              SizedBox(
                height: 10,
              ),
              HeadingAndShowAll(headingtext: MyStrings.feature_products),
              FeatureProductsSlider(),
              SizedBox(
                height: 10,
              ),
              HangOutSlider(),
              SizedBox(height: 15),
              HeadingAndShowAll(headingtext: MyStrings.recommended),
              SizedBox(
                height: 15,
              ),
              RecomendedSliderImage(),
              SizedBox(
                height: 15,
              ),
              HeadingAndShowAll(headingtext: MyStrings.top_colection),
              SizedBox(
                height: 7,
              ),
              TopCollectionSliderOne(),

              TopCollectionSliderTwo(),
              SizedBox(height: 7),
              TopCollectionSlider(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
