import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';

class DressCAtagory extends StatefulWidget {
final Product product;
   DressCAtagory({super.key,required this.product});

  @override
  State<DressCAtagory> createState() => _DressCAtagoryState();
}

class _DressCAtagoryState extends State<DressCAtagory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturesProductsBloc, FeaturesProductsState>(
      builder: (context, state) {
        if (state is FeaturesProductsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is FeaturesProductsLoaded) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 240,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Product product = state.productResponse.products!.product![index];

                      return Container(
                        height: 227,
                        width: 123,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  widget.product.thumbnail!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                product.name!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: MyAssetsStrings.productSansMedium,
                                  fontSize: 12,
                                  color: Color(int.parse(MyColor.myColorSix)),
                                ),
                              ),
                              SizedBox(height: 2,),
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
                      );
                    },
                  ),
                ),
              ),
            ],
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
