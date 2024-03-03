import 'dart:convert';

import 'package:flutter/foundation.dart';
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

  ValueNotifier<int> totalNotification = ValueNotifier(0);

  ValueNotifier<bool> loading = ValueNotifier(false);

  final bool _isNotificationShow = true;

  Box? _favoriteBox;
  Box? _notificationBox;
  Box? _cartBox;

  static final ProductStorageManager _instance = ProductStorageManager._internal();

  ProductStorageManager._internal();

  factory ProductStorageManager() {
    return _instance;
  }

  Future<void> init() async {
    loading.value = true;

    _cartBox = await Hive.openBox("cart");
    _notificationBox = await Hive.openBox("notification");
    _favoriteBox = await Hive.openBox("favorite");

    // await _cartBox!.clear();
    // await _notificationBox!.clear();
    // await _favoriteBox!.clear();

    await _getCartProducts();
    await _getNotifications();
    await _getAllFavoriteProducts();

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
      await _favoriteBox!.delete(product.id!);

      _showLog("addToFavorite -> remove from favorite successfully");

      _showNotification(
        title: "Remove form favorite",
          description: "${product.name?.substring(0, 30)}... remove form favorite"
      );
    }
    else {
      await _favoriteBox!.put(product.id!, jsonEncode(product.toJson()));

      _showLog("addToFavorite -> add to favorite successfully");

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

    _showLog("Count favorite products -> ${favoriteProducts.value.length}");
  }

  /// cart
  CartProduct? _checkProductExistInCart(CartProduct cartProduct) {
    for(CartProduct tempProduct in cartProducts.value) {
      if(tempProduct.product.id == cartProduct.product.id) {
        return tempProduct;
      }
    }

    return null;
  }

  Future<void> addToCart(CartProduct cartProduct) async {
    CartProduct? productAlreadyInCart = _checkProductExistInCart(cartProduct);

    if(productAlreadyInCart != null) {
      _showLog("addToCart -> Product already in cart");
      return;
    }

    loading.value = true;

    await _cartBox!.put(cartProduct.product.id!, jsonEncode(cartProduct.toJson()));

    await _getCartProducts();

    _showNotification(
      title: "Product added in cart",
      description: "${cartProduct.product.name?.substring(0, 30)}... added in cart",
    );

    loading.value = false;
  }

  Future<void> deleteFromCart(CartProduct cartProduct) async {
    loading.value = true;

    await _favoriteBox!.delete(cartProduct.product.id!);

    _showLog("deleteFromCart -> Product remove from cart successfully");

    await _getCartProducts();

    _showNotification(
      title: "Product remove from cart",
      description: "${cartProduct.product.name?.substring(0, 30)}... remove from cart",
    );

    loading.value = false;
  }

  Future<void> updateQuantity(CartProduct cartProduct) async {
    CartProduct? productAlreadyInCart = _checkProductExistInCart(cartProduct);

    if(productAlreadyInCart == null) {
      _showLog("updateQuantity -> Invalid request. This product not added to cart yet");
      return;
    }

    if(productAlreadyInCart.quantity == cartProduct.quantity) {
      _showLog("updateQuantity -> Product quantity is not changed");
      return;
    }

    loading.value = true;

    await _cartBox!.put(cartProduct.product.id!, jsonEncode(cartProduct.toJson()));

    _showLog("updateQuantity -> Product quantity changed successfully");

    await _getCartProducts();

    _showNotification(
      title: "Product quantity updated",
      description: "Product id:${cartProduct.product.id}. quantity change ${productAlreadyInCart.quantity} to ${cartProduct.quantity}",
    );

    loading.value = false;
  }

  Future<void> _getCartProducts() async {
    List<CartProduct> cartProductInLocal = [];

    for(var productJson in _cartBox?.values ?? []) {
      CartProduct product = CartProduct.fromJson(jsonDecode(productJson));
      cartProductInLocal.add(product);
    }

    cartProducts.value = List.from(cartProductInLocal);

    _showLog("Count cart products -> ${cartProducts.value.length}");
  }

  /// order
  Future<void> placeOrder(OrderModel cartProduct) async {

  }

  /// notifications
  Future<void> _getNotifications() async {
    totalNotification.value = _notificationBox!.length;

    if((_notificationBox?.length ?? 0) <= 0) {
      _showLog('No notifications');
      return;
    }

    List<Notifications> notificationInLocal = [];

    int itemPerLoading = 20;

    int itemFetchStartIndex = _notificationBox!.length - 1 - notifications.value.length;
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

    _showLog("Notifications loaded -> ${notifications.value.length} of ${_notificationBox!.length}");
  }

  Future<void> loadMoreNotifications() async {
    if((_notificationBox?.length ?? 0) <= 0) {
      _showLog('loadMoreNotifications -> No notifications for load more');
      return;
    }

    if(_notificationBox!.length == notifications.value.length) {
      _showLog('loadMoreNotifications -> All notifications loaded');
      return;
    }

    loading.value = true;
    await _getNotifications();
    loading.value = false;
  }

  Future<void> _addNewNotification(Notifications notification) async {
    loading.value = true;

    await _notificationBox!.put(notification.id, jsonEncode(notification.toJson()));

    _showLog("New notification added");

    await _getNotifications();

    loading.value = false;
  }

  /// logs
  void _showLog(String msg) {
    if(kDebugMode) {
      print("ProductStorageManager: $msg");
    }
  }

}
