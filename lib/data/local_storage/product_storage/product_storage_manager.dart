import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gemstore_ecommerce/models/cart_product.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/notifications.dart';
import '../../../models/order_model.dart';
import '../../../models/product_response.dart';

class ProductStorageManager {
  
  ValueNotifier<List<Product>> favoriteProducts = ValueNotifier([]);
  ValueNotifier<List<CartProduct>> cartProducts = ValueNotifier([]);
  ValueNotifier<List<OrderModel>> myOrders = ValueNotifier([]);
  ValueNotifier<List<Notifications>> notifications = ValueNotifier([]);

  ValueNotifier<bool> loading = ValueNotifier(false);

  Box? _favoriteBox;
  
  ProductStorageManager() {
    _init();
  }

  Future<void> _init() async {
    loading.value = true;

    _favoriteBox = await Hive.openBox("favorite");
    // await _favoriteBox!.clear();
    await _getAllFavoriteProducts();

    loading.value = false;
  }

  /// favorite
  Future<void> addToFavorite(Product product) async {
    loading.value = true;

    Product? productAlreadyInFavorite = _checkProductExistInFavorite(product);

    if(productAlreadyInFavorite != null) {
      print("start processing -> remove from favorite");
      await _favoriteBox!.delete(product.id!);
    }
    else {
      print("start processing -> add to favorite");
      await _favoriteBox!.put(product.id!, jsonEncode(product.toJson()));
    }

    await _getAllFavoriteProducts();

    loading.value = false;
  }

  Product? _checkProductExistInFavorite(Product product) {
    for(Product tempProduct in favoriteProducts.value) {
      if(tempProduct.id == product.id) {
        return tempProduct;
      }
    }

    return null;
  }

  Future<void> _getAllFavoriteProducts() async {
    List<Product> productInLocal = [];

    for(int i = 0; i < _favoriteBox!.length; i++) {
      var productJson = await _favoriteBox!.getAt(i)!;

      Product product = Product.fromJson(jsonDecode(productJson));
      productInLocal.add(product);
    }

    favoriteProducts.value = List.from(productInLocal);

    print("Product in favorite -> ${favoriteProducts.value.length}");
  }

  /// cart
  Future<void> addToCart(CartProduct cartProduct) async {

  }

  Future<void> deleteFromCart(CartProduct cartProduct) async {

  }

  Future<void> updateQuantity(CartProduct cartProduct) async {

  }

  /// order
  Future<void> placeOrder(OrderModel cartProduct) async {

  }

  /// notifications

}
