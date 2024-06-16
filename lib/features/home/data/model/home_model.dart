import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class Home {
  int? status;
  String? message;
  List<Categories>? categories;

  Home({this.status, this.message, this.categories});
  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable()
class Categories {
  String? id;
  String? title;
  String? image;
  List<Items>? items;

  Categories({this.id, this.title, this.image, this.items});

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class Items {
  String? id;
  String? title;
  int? price;
  String? image;
  String? description;

  Items({this.id, this.title, this.price, this.image});
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
