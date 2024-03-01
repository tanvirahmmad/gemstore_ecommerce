import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/product_response.dart';



class ProductStorageManager {
  
  ValueNotifier<List<Product>> favoriteProducts = ValueNotifier([]);

  ValueNotifier<bool> loading = ValueNotifier(false);

  Box? _favoriteBox;
  
  ProductStorageManager() {
    _init();
  }

  Future<void> _init() async {
    loading.value = true;

    _favoriteBox = await Hive.openBox("favorite");
    await _getAllFavoriteProducts();

    loading.value = false;
  }

  Future<void> addToFavorite(Product product) async {
    loading.value = true;

    await _favoriteBox!.put(product.id!, product.toJson());

    await _getAllFavoriteProducts();

    loading.value = false;
  }

  Future<void> _getAllFavoriteProducts() async {
    List<Product> productInLocal = [];

    for(int i = 0; i < _favoriteBox!.length; i++) {
      Map<String, dynamic> productJson = await _favoriteBox!.getAt(i)!;
      Product product = Product.fromJson(productJson);
      productInLocal.add(product);
    }

    favoriteProducts.value = productInLocal;
  }

  Future<void> removeFromFavorite(Product product) async {
    loading.value = true;

    await _favoriteBox!.delete(product.id!);

    await _getAllFavoriteProducts();

    loading.value = false;
  }

}
