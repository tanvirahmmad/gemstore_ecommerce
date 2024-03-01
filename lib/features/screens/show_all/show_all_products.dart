import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/features_products/features_products_bloc.dart';
import 'package:gemstore_ecommerce/features/screens/products_by_catagory/products_by_catagory_bloc.dart';
import 'package:gemstore_ecommerce/models/catagory_products_id.dart';
import 'package:gemstore_ecommerce/models/enum.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/models/product_types.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';
import 'package:gemstore_ecommerce/widgets/product_card.dart';

import '../home_screen/get_all_products_bloc/get_all_products_bloc.dart';
import '../recommended_bloc/recommended_products_bloc.dart';

class ShowAllProducts extends StatefulWidget {
  final ProductTypes productTypes;

  final CatagoryName? catagoryName;
  final ProductTags? productTags;

  ShowAllProducts({
    Key? key,
    required this.productTypes,
    this.catagoryName,
    this.productTags,

  }) : super(key: key);

  @override
  State<ShowAllProducts> createState() => _ShowAllProductsState();
}

class _ShowAllProductsState extends State<ShowAllProducts> {
  ValueNotifier<List<Product>> allProducts = ValueNotifier([]);
  bool _isLastPage = false;
  int page = 1;

  bool isLoadMoreActive = false;

  @override
  void initState() {

    print(widget.productTags);
    print(widget.productTypes);

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
      context.read<ProductsByCatagoryBloc>().add(GetProductsByCategory(
          catagoryName: widget.catagoryName!, page: page));
      if (CatagoryName.dress == widget.catagoryName) {
        return "Dress Products";
      }
      if (CatagoryName.shoes == widget.catagoryName) {
        return "Shoes Products";
      }
      if (CatagoryName.accessories == widget.catagoryName) {
        return "Accessories Products";
      }
      if (CatagoryName.beauty == widget.catagoryName) {
        return "Beauty Products";
      }
    }else if (widget.productTypes == ProductTypes.tags) {
      context.read<GetAllProductsBloc>().add(GetAllProducts(producTags: widget.productTags!, page: page));
      return widget.productTags!.tags;
    }

    return "All Products";
  }

  void loadNextPage() {
    if (isLoadMoreActive) return;

    isLoadMoreActive = true;

    page++;

    if (widget.productTypes == ProductTypes.feature) {
      context.read<FeaturesProductsBloc>().add(GetFeaturesProducts(page: page));
    } else if (widget.productTypes == ProductTypes.recommended) {
      context.read<RecommendedProductsBloc>().add(GetRecommendedProducts(page: page));
    } else if (widget.productTypes == ProductTypes.catagory) {
      context.read<ProductsByCatagoryBloc>().add(GetProductsByCategory (catagoryName: widget.catagoryName!, page: page));
    } else if (widget.productTypes == ProductTypes.tags) {
      context.read<GetAllProductsBloc>().add(GetAllProducts(producTags: widget.productTags!, page: page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarNames()),
      ),
      body: widget.productTypes == ProductTypes.feature
          ?  _featuresProducts()
          : widget.productTypes == ProductTypes.recommended
            ? _recommendedProducts()
            : widget.productTypes == ProductTypes.tags
              ? _tagProducts()
              : widget.productTypes == ProductTypes.catagory
                ? productsbyCategoryProducts()
                : const Text("Invalid Category")
      ,
    );
  }

  Widget _tagProducts() {
    return BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
        builder: (context, state) {
          if (state is GetAllProductsLoading) {
            if (page == 1) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              return _showAllProducts();
            }
          }
          if (state is GetAllProductsLoaded) {
            isLoadMoreActive = false;

            allProducts.value.addAll(state.getallproductResponse.products?.product ?? []);

            if (state.getallproductResponse.products!.currentPage! >= state.getallproductResponse.products!.lastPage!) {
              _isLastPage = true;
            }

            return _showAllProducts();
          }
          if (state is GetAllProductsError) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        });
  }

  Widget _recommendedProducts() {
    return BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
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

            allProducts.value.addAll(state.recommendedProductResponse.products?.product ?? []);

            if (state.recommendedProductResponse.products!.currentPage! >= state.recommendedProductResponse.products!.lastPage!) {
              _isLastPage = true;
            }

            return _showAllProducts();
          }
          if (state is RecommendedProductsError) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        });
  }

  Widget _featuresProducts() {
    return BlocBuilder<FeaturesProductsBloc, FeaturesProductsState>(
        builder: (context, state) {
          if (state is FeaturesProductsLoading) {
            if (page == 1) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              return _showAllProducts();
            }
          }
          if (state is FeaturesProductsLoaded) {
            isLoadMoreActive = false;

            allProducts.value.addAll(state.productResponse.products?.product ?? []);

            if (state.productResponse.products!.currentPage! >= state.productResponse.products!.lastPage!) {
              _isLastPage = true;
            }

            return _showAllProducts();
          }
          if (state is FeaturesProductsError) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        });
  }

  Widget productsbyCategoryProducts() {
    return BlocBuilder<ProductsByCatagoryBloc, ProductsByCatagoryState>(
        builder: (context, state) {
          if (state is ProductsByCatagoryLoading) {
            if (page == 1) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              return _showAllProducts();
            }
          }
          if (state is ProductsByCatagoryLoaded) {
            isLoadMoreActive = false;

            allProducts.value.addAll(state.getproductsbycatagoryResponse.products?.product ?? []);

            if (state.getproductsbycatagoryResponse.products!.currentPage! >= state.getproductsbycatagoryResponse.products!.lastPage!) {
              _isLastPage = true;
            }

            return _showAllProducts();
          }
          if (state is ProductsByCatagoryError) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        });
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
                onTap: ()
                {
MyRoutes.navigateToDetailsScreen(context, (allProducts.value[index]));


                },
                child: ProductCard(
                  product: allProducts.value[index],
                ),
              );
            } else {
              if (!_isLastPage) {
                loadNextPage();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        );
      },
    );
  }
}
