class ProductResponse {
  bool? status;
  Products? products;

  ProductResponse({this.status, this.products});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    products =
        json['products'] != null ? Products.fromJson(json['products']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}

class Products {
  int? currentPage;
  List<Product>? product;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Products(
      {this.currentPage,
      this.product,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (product != null) {
      data['data'] = product!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  List<String>? description;
  String? tag;
  int? categoryId;
  double? price;
  double? discountPrice;
  double? discountPercent;
  int? stockLeft;
  List<String>? size;
  List<Color>? color;
  int? ratingCount;
  int? ratingOne;
  int? ratingTwo;
  int? ratingThree;
  int? ratingFour;
  int? ratingFive;
  int? reviewCount;
  String? thumbnail;
  List<String>? otherImages;

  Product({
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
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'].cast<String>();
    tag = json['tag'];
    categoryId = int.parse(json['category_id'].toString());
    price = double.parse(json['price'].toString());
    discountPrice = double.parse(json['discount_price'].toString());
    discountPercent = double.parse(json['discount_percent'].toString());
    stockLeft = int.parse(json['stock_left'].toString());
    size = json['size'].cast<String>();
    if (json['color'] != null) {
      color = <Color>[];
      json['color'].forEach((v) {
        color!.add(Color.fromJson(v));
      });
    }
    ratingCount = int.parse(json['rating_count'].toString());
    ratingOne = int.parse(json['rating_one'].toString());
    ratingTwo = int.parse(json['rating_two'].toString());
    ratingThree = int.parse(json['rating_three'].toString());
    ratingFour = int.parse(json['rating_four'].toString());
    ratingFive = int.parse(json['rating_five'].toString());
    reviewCount = int.parse(json['review_count'].toString());
    thumbnail = json['thumbnail'];
    otherImages = json['other_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['tag'] = tag;
    data['category_id'] = categoryId;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['discount_percent'] = discountPercent;
    data['stock_left'] = stockLeft;
    data['size'] = size;
    if (color != null) {
      data['color'] = color!.map((v) => v.toJson()).toList();
    }
    data['rating_count'] = ratingCount;
    data['rating_one'] = ratingOne;
    data['rating_two'] = ratingTwo;
    data['rating_three'] = ratingThree;
    data['rating_four'] = ratingFour;
    data['rating_five'] = ratingFive;
    data['review_count'] = reviewCount;
    data['thumbnail'] = thumbnail;
    data['other_images'] = otherImages;
    return data;
  }
}

class Color {
  String? colorName;
  String? colorValue;

  Color({this.colorName, this.colorValue});

  Color.fromJson(Map<String, dynamic> json) {
    colorName = json['colorName'];
    colorValue = json['colorValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['colorName'] = colorName;
    data['colorValue'] = colorValue;
    return data;
  }
}
