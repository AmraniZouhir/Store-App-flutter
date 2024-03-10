import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/Models/users_model.dart';
import 'package:storeapp/consts/api_const.dart';

class ApiHandler {
  static Future<List<Map<String, dynamic>>> getAllData({
    required String path,
    int maxRetries = 3,
  }) async {
    var retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        var uri = Uri.https(BASE_URL, path);
        var response = await http.get(uri);

        print('Response Body: ${response.body}'); // For debugging

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data is List) {
            return List<Map<String, dynamic>>.from(data);
          } else {
            throw Exception('Invalid response format');
          }
        } else {
          throw Exception(
              'Failed to load data, status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error in getAllData: $e');
        retryCount++;
      }
    }

    throw Exception('Max retries reached, failed to establish a connection.');
  }

  //all product
  static Future<List<ProductsModel>> getAllProdact() async {
    var data = await getAllData(path: "/products");
    return ProductsModel.productsFromSnapshot(data);
  }

  static Future<List<ProductsModel>> getProdactsByCategory(
      String category) async {
    try {
      var uri = Uri.https(BASE_URL, "/products", {"category": category});
      var data = await getAllData(path: uri.path);
      return ProductsModel.productsFromSnapshot(data);
    } catch (error) {
      print('Error fetching products: $error');
      throw error;
    }
  }

  //all users
  static Future<List<UsersModel>> getAllUsers() async {
    var data = await getAllData(path: "/users");
    return UsersModel.UsersFromSnapshot(data);
  }

  static Future<ProductsModel> getProdactBayId({required String id}) async {
    var uri = Uri.https(BASE_URL, 'products/$id');
    var response = await http.get(uri);

    var data = jsonDecode(response.body);
    return ProductsModel.fromJson(data);
  }
}
