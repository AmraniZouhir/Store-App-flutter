import 'package:storeapp/Models/category_model.dart';

class productsModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoryModels? category;

  productsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.category});

  productsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = (json['images'] as List<dynamic>)
        .map((imageList) => imageList[0].toString())
        .toList();
    category = json['category'] != null
        ? new CategoryModels.fromJson(json['category'])
        : null;
  }

  // productsModel.fromJson(Map<String, dynamic> json) {
  //   // ...
  //   images = (json['images'] as List<dynamic>)
  //       .map((imageList) => imageList[0].toString())
  //       .toList();
  //   // ...
  // }

  static List<productsModel> ProductsFromSnapshot(List prodactSnapshot) {
    print(
        "data ${prodactSnapshot[1]}"); // hna 9drna njbdo prodact b index dyalo

    return prodactSnapshot.map((data) {
      // print("data $data");
      // hna had data hya V kola prodact bohdo
      return productsModel.fromJson(data);
    }).toList();
  }
}
