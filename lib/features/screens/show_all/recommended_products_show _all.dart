import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/recommended_bloc/recommended_products_bloc.dart';
import 'package:gemstore_ecommerce/models/enum.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';
import 'package:gemstore_ecommerce/widgets/product_card.dart';

class RecommendedShowAllProducts extends StatefulWidget {
  final ProductTypes productTypes;
  int? catagoryId;
  final ProductTags? productTags;

  RecommendedShowAllProducts({
    Key? key,
    required this.productTypes,
    this.catagoryId,
    this.productTags,
  }) : super(key: key);

  @override
  State<RecommendedShowAllProducts> createState() =>
      _RecommendedShowAllProductsState();
}

class _RecommendedShowAllProductsState
    extends State<RecommendedShowAllProducts> {
  ValueNotifier<List<Product>> allProducts = ValueNotifier([]);
  bool _isLastPage = false;
  int page = 1;
  bool isLoadMoreActive = false;

  @override
  void initState() {
    if (widget.productTypes == ProductTypes.feature) {
    } else if (widget.productTypes == ProductTypes.recommended) {
    } else if (widget.productTypes == ProductTypes.catagory) {
    } else if (widget.productTypes == ProductTypes.tags) {}
    super.initState();
  }

  String appbarNames() {
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

  void loadNextPage() {
    if (isLoadMoreActive) return;

    isLoadMoreActive = true;

    if (widget.productTypes == ProductTypes.feature) {
      // Handle loading for features products
    } else if (widget.productTypes == ProductTypes.recommended) {
      context
          .read<RecommendedProductsBloc>()
          .add(GetRecommendedProducts(page: page));
    } else if (widget.productTypes == ProductTypes.catagory) {
      // Handle loading for catagory products
    } else if (widget.productTypes == ProductTypes.tags) {
      // Handle loading for tags
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarNames()),
      ),
      body: BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
          builder: (context, state) {
            if (state is RecommendedProductsLoading) {
              if (page == 1) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else {
                return _showAllProducts();
              }
            }
            if (state is RecommendedProductsLoaded) {
              isLoadMoreActive = false;

              allProducts.value
                  .addAll(state.recommendedProductResponse.products?.product ?? []);

              if (state.recommendedProductResponse.products!.currentPage! >=
                  state.recommendedProductResponse.products!.lastPage!) {
                _isLastPage = true;
              }

              return _showAllProducts();
            }
            if (state is RecommendedProductsError) {
              return Center(child: Text(state.error));
            }

            return const SizedBox();
          }),
    );
  }

  Widget _showAllProducts() {
    return ValueListenableBuilder(
      valueListenable: allProducts,
      builder: (context, value, _) {
        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 290,
          ),
          itemCount: allProducts.value.length + 1,
          itemBuilder: (context, index) {
            if (index < allProducts.value.length) {
              return InkWell(
                onTap: () {
                  MyRoutes.navigateToDetailsScreen(
                      context, allProducts.value[index]);
                },
                child: ProductCard(
                  product: allProducts.value[index],
                ),
              );
            } else {
              if (!_isLastPage) {
                loadNextPage();
                return const CircularProgressIndicator.adaptive();
              }
            }
          },
        );
      },
    );
  }
}
