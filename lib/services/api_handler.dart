import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/Models/users_model.dart';
import 'package:storeapp/consts/api_const.dart';

class ApiHandler {
  static Future<List<Map<String, dynamic>>> getAllData(
      {required String path}) async {
    var uri = Uri.https(BASE_URL, path);
    var response = await http.get(uri);

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
  }

  //all product
  static Future<List<ProductsModel>> getAllProdact() async {
    var data = await getAllData(path: "/products");
    return ProductsModel.ProductsFromSnapshot(data);
  }

  // //all categories
  // static Future<List<Category>> getAllCategories() async {
  //   var data = await getAllData(path: "/products/categories");

  //   if (data == null) {
  //     throw Exception('No data received from the API');
  //   }

  //   if (data is List) {
  //     return data
  //         .map((category) => Category(name: category.toString()))
  //         .toList();
  //   } else {
  //     throw Exception('Invalid response format for categories');
  //   }
  // }

  //all users
  static Future<List<UsersModel>> getAllUsers() async {
    var data = await getAllData(path: "/users");
    return UsersModel.UsersFromSnapshot(data);
  }
}
