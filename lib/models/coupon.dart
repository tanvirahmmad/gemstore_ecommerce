class Coupon {
  String couponName;
  double? discountPrice;
  double? discountPercent;

  Coupon({
    required this.couponName,
    this.discountPrice,
    this.discountPercent,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        couponName: json["couponName"],
        discountPrice: json["discountPrice"],
        discountPercent: json["discountPercent"],
      );

  Map<String, dynamic> toJson() => {
        "couponName": couponName,
        "discountPrice": discountPrice,
        "discountPercent": discountPercent,
      };
}
