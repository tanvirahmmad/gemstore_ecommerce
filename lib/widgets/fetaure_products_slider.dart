import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';

class FeatureProductsSlider extends StatelessWidget {
  const FeatureProductsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturesProductsBloc, FeaturesProductsState>(
      builder: (context, state) {

        if (state is FeaturesProductsLoading) {
          return const Center(
              child: CupertinoActivityIndicator());
        }

        if (state is FeaturesProductsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16);
                },
                itemBuilder: (BuildContext context, int index) {

                  Product product = state.productResponse.products!.product![index];

                  return Container(height: 227,
                    width: 127,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product.thumbnail!,
                        //  height: 172,
                          //width: 126,
                        ),
                        Text(
                          product.name!,
                          maxLines: 3, // You can adjust this based on your design
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: MyAssetsStrings.productSansMedium,
                            fontSize: 12,
                            color: Color(int.parse(MyColor.myColorSix)),
                          ),
                        ),
                        Text(
                          "\$ ${product.price}",
                          style: TextStyle(
                            fontFamily: MyAssetsStrings.productSansMedium,
                            fontSize: 16,
                            color: Color(int.parse(MyColor.myColorSix)),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }


        if (state is FeaturesProductsError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();

      },
    );
  }
}
