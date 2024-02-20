import 'dart:convert';
import 'dart:io';

import 'package:gemstore_ecommerce/common/server_urls.dart';
import 'package:gemstore_ecommerce/models/category_response.dart';
import 'package:http/http.dart' as https;

class CategoryRepository {
  Future<CategoryResponse> getAllCategory () async {

    try {
      var response = await https.get(Uri.parse(ServerUrls.categoryUrl));

      if (response.statusCode == 200) {

        Map<String, dynamic> responseAsMap = jsonDecode(response.body);

        if(responseAsMap["status"] == true) {
          return CategoryResponse.fromJson(responseAsMap);
        } else {
          throw Exception("Failed to get data");
        }

      } else {
        throw Exception("Something wrong on response");
      }

    }
    catch (e) {
      if(e is SocketException) {
        throw Exception("No internet connection");
      }
      else {
        throw Exception(e.toString());
      }
    }
  }
}