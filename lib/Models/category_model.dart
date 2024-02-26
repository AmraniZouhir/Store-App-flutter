class CategoryModels {
  int? id;
  String? name;
  String? image;

  CategoryModels({this.id, this.name, this.image});

  CategoryModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
