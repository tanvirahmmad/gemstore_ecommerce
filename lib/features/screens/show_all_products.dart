import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/models/enum.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/widgets/product_card.dart';

class ShowAllProducts extends StatefulWidget {
  final ProductTypes productTypes;
  int? catagoryId;
  final ProductTags? productTags;

  ShowAllProducts({
    Key? key,
    required this.productTypes,
    this.catagoryId,
    this.productTags,
  }) : super(key: key);

  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {

  @override
  void initState() {
    if (widget.productTypes == ProductTypes.feature) {
    } else if (widget.productTypes == ProductTypes.recommended) {
    } else if (widget.productTypes == ProductTypes.catagory) {
    } else if (widget.productTypes == ProductTypes.tags) {}
    super.initState();
  }
String appbarNames(){
    if (widget.productTypes == ProductTypes.feature) {
      return "Features Products";
    } else if (widget.productTypes == ProductTypes.recommended) {
      return "Recommended Products";
    } else if (widget.productTypes == ProductTypes.catagory) {
      return "Catagory Products";
    } else {
      return "tags";
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:
      AppBar(title: Text(
        appbarNames()
      ),),

      body:
      BlocBuilder<FeaturesProductsBloc, FeaturesProductsState>(
          builder: (context, state) {
        if (state is FeaturesProductsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is FeaturesProductsLoaded) {
          return GridView.builder(padding: EdgeInsets.all( 8),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
crossAxisSpacing: 8,
              mainAxisSpacing: 8,

              mainAxisExtent: 290

            ),
            itemCount: state.productResponse.products!.product!.length,
            itemBuilder: (context, index) {
              return ProductCard(
              product:  state.productResponse.products!.product![index],
              );
            },
          );
        }
        if (state is FeaturesProductsError) {
          return Center(child: Text(state.error));
        }

        return const SizedBox();
      }),
    );
  }


  }

