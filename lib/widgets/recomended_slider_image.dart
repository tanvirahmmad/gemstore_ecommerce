import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/features/screens/recommended_bloc/recommended_products_bloc.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';
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
          return SizedBox(
            height: 66,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.recommendedProductResponse.products!.product!.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 13.5);
              },
              itemBuilder: (BuildContext context, int index) {
                Product product = state.recommendedProductResponse.products!.product![index];

                return Container(
                  height:66,
                  width: 250,
                  margin:EdgeInsets.only(

                    left: index==0?13:0,
                    right: index==state.recommendedProductResponse.products!.product!.length-1?13:0,

                  ),
                 decoration:  BoxDecoration(
                     borderRadius: BorderRadius.circular(9.0),
                     color: Colors.white,
                   boxShadow: [
                   BoxShadow(
                   color: Colors.grey,
                   offset: Offset( 1.0,0.4), // Adjust the offset for the shadow
                   blurRadius: 6.5, // Adjust the blur radius
                   spreadRadius: 0.0, // Adjust the spread radius
                 ),],
                  ),

                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,

                    onTap: ()
                    {
                      MyRoutes.navigateToProductDetailsScreen(context, product);
                    },
                    child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          product.thumbnail!,
                          height: 100,
                       width: 70,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis ,
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
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        // Handle other states if needed
        return Container();
      },
    );
  }
}
