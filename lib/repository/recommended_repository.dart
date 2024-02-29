import 'dart:convert';
import 'dart:io';
import 'package:gemstore_ecommerce/common/server_urls.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:http/http.dart' as https;
class RecommendedProductsRepository {
  Future<ProductResponse> getRecommendedProducts({int page=1}) async {
    try {
      String url = "${ServerUrls.recommendedProducts}?page=$page";


      var response = await https.get(Uri.parse(url));


      if (response.statusCode == 200) {
        Map<String, dynamic> responseAsMap = jsonDecode(response.body);

        if (responseAsMap["status"] == true) {
          return ProductResponse.fromJson(responseAsMap);
        } else {
          throw Exception("Failed to get data");
        }
      } else {
        throw Exception("Something wrong on response");
      }
    }
    catch (e, s) {
      print(s);
      if (e is SocketException) {
        throw Exception("No internet connection");
      }
      else {
        throw Exception(e.toString());
      }
    }
  }
}
