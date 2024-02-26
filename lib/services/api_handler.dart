import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/Models/prodacts_model.dart';
import 'package:storeapp/consts/api_const.dart';

class ApiHandler {
  static Future<List<productsModel>> getAllProdact() async {
    var uri = Uri.https(BASE_URL, "/api/v1/products");
    var response = await http.get(uri);

    // print('response ${jsonDecode(response.body)}');
    // hna drna for bach njbdo g3 les item likaynin f response.body bach njbdo kolawahd bohdo
    var data = jsonDecode(response.body);
    List TempList = [];
    for (var v in data) {
      // daba hna rah V hya kola Prodact bohdo
      TempList.add(
          v); // hna htina kola prodact f list bach n9dro nwslo l kola item f lprodact
      // print('v $v \n\n');
    }
    return productsModel.ProductsFromSnapshot(
        TempList); // hna had TempList fiha dik V lihya kola
  }
}
