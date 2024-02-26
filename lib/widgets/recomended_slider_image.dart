import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/get_all_products_bloc/get_all_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/recommended_bloc/recommended_products_bloc.dart';
import '../models/product_response.dart';
class RecomendedSliderImage extends StatelessWidget {
  const RecomendedSliderImage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
      builder: (BuildContext context, state) {
        if (state is RecommendedProductsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is RecommendedProductsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.recommendedProductResponse.products!.product!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16);
                },
                itemBuilder: (BuildContext context, int index) {
                  Product product = state.recommendedProductResponse.products!.product![index];

                  return SizedBox(
                    height: 10,
                    child: Row(
                      children: [
                        Image.network(
                          product.thumbnail!,
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 213,
                              child: Text(
                                product.name!,
                                style: TextStyle(
                                  fontFamily: MyAssetsStrings.productSansMedium,
                                  fontSize: 16,
                                  color: Color(int.parse(MyColor.myColorSix)),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
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
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }

        // Handle other states if needed
        return Container();
      },
    );
  }
}
