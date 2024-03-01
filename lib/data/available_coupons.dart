import 'package:gemstore_ecommerce/models/coupon.dart';

class AvailableCoupons {
  Coupon? isCouponValid(String couponName) {
    List<Coupon> coupons = [
      Coupon(
        couponName: "Himel420",
        discountPercent: 10,
      ),
      Coupon(
        couponName: "NewYear",
        discountPercent: 25,
      ),
      Coupon(
        couponName: "LeapYear",
        discountPercent: 50,
      ),
      Coupon(
        couponName: "Dhamaka",
        discountPrice: 100,
      ),
    ];

    for (Coupon c in coupons) {
      if (c.couponName == couponName) {
        return c;
      }
    }

    return null;
  }
}
