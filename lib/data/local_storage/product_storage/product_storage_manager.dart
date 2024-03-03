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

    if((_notificationBox?.length ?? 0) <= 0) return;

    List<Notifications> notificationInLocal = [];

    int itemPerLoading = 20;

    int itemFetchStartIndex = _favoriteBox!.length - 1 - notifications.value.length;
    // _favoriteBox!.length = 100;
    // for notifications.value.length = 0; itemFetchStartIndex = 100 - 1 - 0 = 99
    // for notifications.value.length = 30; itemFetchStartIndex = 100 - 1 - 30 = 69
    // for notifications.value.length = 80; itemFetchStartIndex = 100 - 1 - 80 = 19
    // for notifications.value.length = 90; itemFetchStartIndex = 100 - 1 - 90 = 9

    // _favoriteBox!.length = 0;
    // for notifications.value.length = 0; itemFetchStartIndex = 0 - 1 - 0 = -1 (invalid, return on first)

    int itemFetchEndIndex = (itemFetchStartIndex - itemPerLoading <= 0) ? 0 : itemFetchStartIndex - itemPerLoading;
    // _favoriteBox!.length = 100;
    // for notifications.value.length = 0; itemFetchEndIndex = (99 - 20 <= 0) => 70
    // for notifications.value.length = 30; itemFetchEndIndex = (69 - 20 <= 0) => 49
    // for notifications.value.length = 80; itemFetchEndIndex = (19 - 20 <= 0) => 0
    // for notifications.value.length = 90; itemFetchEndIndex = (9 - 20 <= 0) => 0

    for(int i = itemFetchStartIndex; i >= itemFetchEndIndex; i--) {
      var notificationJson = await _notificationBox!.getAt(i)!;

      Notifications notifications = Notifications.fromJson(jsonDecode(notificationJson));

      notificationInLocal.add(notifications);
    }

    notifications.value = List.from(notificationInLocal);

    print("Notification Count -> ${notifications.value.length} of ${_notificationBox!.length}");
  }

  Future<void> loadMoreNotifications() async {
    if((_notificationBox?.length ?? 0) <= 0) return;
    if(_notificationBox!.length == notifications.value.length) return;

    loading.value = true;
    await _getNotifications();
    loading.value = false;
  }

  Future<void> _addNewNotification(Notifications notification) async {
    loading.value = true;

    await _notificationBox!.put(notification.id, jsonEncode(notification.toJson()));

    await _getNotifications();

    loading.value = false;
  }

}
