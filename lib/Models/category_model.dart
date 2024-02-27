// class CategoryModels {
//   int? id;
//   String? name;
//   String? image;

//   CategoryModels({this.id, this.name, this.image});

//   CategoryModels.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }
// }

import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  String name;

  CategoryModel({
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  static List<CategoryModel> CategosisFromSnapshot(List CategorySnapshot) {
    print("data ${CategorySnapshot}"); // hna 9drna njbdo prodact b index dyalo

    return CategorySnapshot.map((data) {
      print("data $data");
      // hna had data hya V kola prodact bohdo
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
