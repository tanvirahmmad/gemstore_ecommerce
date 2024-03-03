import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gemstore_ecommerce/common/notification_manager.dart';
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

  final bool _isNotificationShow = true;

  Box? _favoriteBox;
  Box? _notificationBox;

  static final ProductStorageManager _instance = ProductStorageManager._internal();

  ProductStorageManager._internal();

  factory ProductStorageManager() {
    return _instance;
  }

  Future<void> init() async {
    loading.value = true;

    _favoriteBox = await Hive.openBox("favorite");
    _notificationBox = await Hive.openBox("notification");
    // await _favoriteBox!.clear();
    await _getAllFavoriteProducts();
    await _getNotifications();

    loading.value = false;
  }

  Future<void> _showNotification({
    required String title,
    required String description,
  }) async {
    if(_isNotificationShow) {
      NotificationManager().showNotification(
        title: title,
        description: description,
      );
    }

    await _addNewNotification(Notifications(
        title: title,
        msg: description,
    ));

  }

  /// favorite
  Future<void> addToFavorite(Product product) async {
    loading.value = true;

    Product? productAlreadyInFavorite = _checkProductExistInFavorite(product);

    if(productAlreadyInFavorite != null) {
      print("start processing -> remove from favorite");
      await _favoriteBox!.delete(product.id!);
      _showNotification(
        title: "Remove form favorite",
          description: "${product.name?.substring(0, 30)}... remove form favorite"
      );
    }
    else {
      print("start processing -> add to favorite");
      await _favoriteBox!.put(product.id!, jsonEncode(product.toJson()));
      _showNotification(
        title: "Add to favorite",
        description: "${product.name?.substring(0, 30)}... added to favorite",
      );
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
  Future<void> _getNotifications() async {
    List<Notifications> notificationInLocal = [];

    for(var item in _notificationBox!.values) {
      Notifications notifications = Notifications.fromJson(jsonDecode(item));

      notificationInLocal.add(notifications);
    }

    notifications.value = List.from(notificationInLocal);

    print("Total Notification Count -> ${notifications.value.length}");
  }

  Future<void> _addNewNotification(Notifications notification) async {
    loading.value = true;

    await _notificationBox!.put(notification.id, jsonEncode(notification.toJson()));

    await _getNotifications();

    loading.value = false;
  }

}
