// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:storeapp/Models/prodacts_model.dart';
// import 'package:storeapp/consts/api_const.dart';

// class ApiHandler {
//   static Future<List<ProductsModel>> getAllProdact() async {
//     var uri = Uri.https(BASE_URL, "/api/v1/products");
//     var response = await http.get(uri);

//     // print('response ${jsonDecode(response.body)}');
//     // hna drna for bach njbdo g3 les item likaynin f response.body bach njbdo kolawahd bohdo
//     var data = jsonDecode(response.body);
//     List TempList = [];
//     for (var v in data) {
//       // daba hna rah V hya kola Prodact bohdo
//       TempList.add(
//           v); // hna htina kola prodact f list bach n9dro nwslo l kola item f lprodact
//       // print('v $v \n\n');
//     }
//     return ProductsModel.ProductsFromSnapshot(
//         TempList); // hna had TempList fiha dik V lihya kola
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/Models/category_model.dart';
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

  //all categories
  static Future<List<CategoryModel>> getAllCategories() async {
    var data = await getAllData(path: "/products/categorie");
    return CategoryModel.CategosisFromSnapshot(data);
  }

  //all users
  static Future<List<UsersModel>> getAllUsers() async {
    var data = await getAllData(path: "/users");
    return UsersModel.UsersFromSnapshot(data);
  }
}
