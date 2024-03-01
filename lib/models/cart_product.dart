import 'package:gemstore_ecommerce/models/product_response.dart';

class CartProduct {
  Product product;
  int quantity;

  CartProduct({
    required this.product,
    this.quantity = 1,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        product: json["product"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
      };
}
