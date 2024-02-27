// import 'package:flutter/material.dart';
// import 'package:storeapp/Models/category_model.dart';

// class productsModel with ChangeNotifier {
//   int? id;
//   String? title;
//   int? price;
//   String? description;
//   List<String>? images;
//   CategoryModels? category;

//   productsModel(
//       {this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.images,
//       this.category});

//   productsModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     images = (json['images'] as List<dynamic>)
//         .map((imageList) => imageList[0].toString())
//         .toList();
//     category = json['category'] != null
//         ? new CategoryModels.fromJson(json['category'])
//         : null;
//   }

//   // productsModel.fromJson(Map<String, dynamic> json) {
//   //   // ...
//   //   images = (json['images'] as List<dynamic>)
//   //       .map((imageList) => imageList[0].toString())
//   //       .toList();
//   //   // ...
//   // }

//   static List<productsModel> ProductsFromSnapshot(List prodactSnapshot) {
//     print(
//         "data ${prodactSnapshot[1]}"); // hna 9drna njbdo prodact b index dyalo

//     return prodactSnapshot.map((data) {
//       // print("data $data");
//       // hna had data hya V kola prodact bohdo
//       return productsModel.fromJson(data);
//     }).toList();
//   }
// }

import 'package:flutter/material.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      price: json['price']?.toDouble(), // Assuming price is in double format
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
    return data;
  }

  static List<ProductsModel> ProductsFromSnapshot(List prodactSnapshot) {
    // print("data ${prodactSnapshot[1]}"); // hna 9drna njbdo prodact b index dyalo

    return prodactSnapshot.map((data) {
      // print("data $data");
      // hna had data hya V kola prodact bohdo
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
