import 'package:hive_flutter/hive_flutter.dart';

part 'hive.g.dart';

@HiveType(typeId: 32)
class ItemsFavorite extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  int? price;

  @HiveField(3)
  String? image;

  ItemsFavorite({this.id, this.title, this.price, this.image});
}
