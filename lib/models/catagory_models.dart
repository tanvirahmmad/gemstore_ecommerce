// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  bool? status;
  ProductsClass? products;

  Products({
    this.status,
    this.products,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    status: json["status"],
    products: json["products"] == null ? null : ProductsClass.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "products": products?.toJson(),
  };
}

class ProductsClass {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  ProductsClass({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ProductsClass.fromJson(Map<String, dynamic> json) => ProductsClass(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int? id;
  String? name;
  List<String>? description;
  String? tag;
  String? categoryId;
  String? price;
  String? discountPrice;
  String? discountPercent;
  String? stockLeft;
  dynamic size;
  List<Color>? color;
  String? ratingCount;
  String? ratingOne;
  String? ratingTwo;
  String? ratingThree;
  String? ratingFour;
  String? ratingFive;
  String? reviewCount;
  String? thumbnail;
  List<String>? otherImages;
  dynamic createdAt;
  dynamic updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.tag,
    this.categoryId,
    this.price,
    this.discountPrice,
    this.discountPercent,
    this.stockLeft,
    this.size,
    this.color,
    this.ratingCount,
    this.ratingOne,
    this.ratingTwo,
    this.ratingThree,
    this.ratingFour,
    this.ratingFive,
    this.reviewCount,
    this.thumbnail,
    this.otherImages,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"] == null ? [] : List<String>.from(json["description"]!.map((x) => x)),
    tag: json["tag"],
    categoryId: json["category_id"],
    price: json["price"],
    discountPrice: json["discount_price"],
    discountPercent: json["discount_percent"],
    stockLeft: json["stock_left"],
    size: json["size"],
    color: json["color"] == null ? [] : List<Color>.from(json["color"]!.map((x) => Color.fromJson(x))),
    ratingCount: json["rating_count"],
    ratingOne: json["rating_one"],
    ratingTwo: json["rating_two"],
    ratingThree: json["rating_three"],
    ratingFour: json["rating_four"],
    ratingFive: json["rating_five"],
    reviewCount: json["review_count"],
    thumbnail: json["thumbnail"],
    otherImages: json["other_images"] == null ? [] : List<String>.from(json["other_images"]!.map((x) => x)),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description == null ? [] : List<dynamic>.from(description!.map((x) => x)),
    "tag": tag,
    "category_id": categoryId,
    "price": price,
    "discount_price": discountPrice,
    "discount_percent": discountPercent,
    "stock_left": stockLeft,
    "size": size,
    "color": color == null ? [] : List<dynamic>.from(color!.map((x) => x.toJson())),
    "rating_count": ratingCount,
    "rating_one": ratingOne,
    "rating_two": ratingTwo,
    "rating_three": ratingThree,
    "rating_four": ratingFour,
    "rating_five": ratingFive,
    "review_count": reviewCount,
    "thumbnail": thumbnail,
    "other_images": otherImages == null ? [] : List<dynamic>.from(otherImages!.map((x) => x)),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Color {
  ColorName? colorName;
  ColorValue? colorValue;

  Color({
    this.colorName,
    this.colorValue,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    colorName: colorNameValues.map[json["colorName"]]!,
    colorValue: colorValueValues.map[json["colorValue"]]!,
  );

  Map<String, dynamic> toJson() => {
    "colorName": colorNameValues.reverse[colorName],
    "colorValue": colorValueValues.reverse[colorValue],
  };
}

enum ColorName {
  BRANDY_PUNCH,
  FADED_RED,
  MEDIUM_TAUPE,
  MINERAL_GREEN,
  MIRAGE,
  PALE_CHESTNUT
}

final colorNameValues = EnumValues({
  "Brandy Punch": ColorName.BRANDY_PUNCH,
  "Faded Red": ColorName.FADED_RED,
  "Medium Taupe": ColorName.MEDIUM_TAUPE,
  "Mineral Green": ColorName.MINERAL_GREEN,
  "Mirage": ColorName.MIRAGE,
  "Pale Chestnut": ColorName.PALE_CHESTNUT
});

enum ColorValue {
  CE8722,
  DC4447,
  DFA8_A9,
  E4_E4_E4,
  THE_181_E27,
  THE_44565_C,
  THE_6_D4_F44
}

final colorValueValues = EnumValues({
  "#CE8722": ColorValue.CE8722,
  "#DC4447": ColorValue.DC4447,
  "#DFA8A9": ColorValue.DFA8_A9,
  "#E4E4E4": ColorValue.E4_E4_E4,
  "#181E27": ColorValue.THE_181_E27,
  "#44565C": ColorValue.THE_44565_C,
  "#6D4F44": ColorValue.THE_6_D4_F44
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

