import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'akelni_app.dart';
import 'core/helper/app_strings.dart';
import 'core/injection.dart';
import 'features/favorite/data/model/hive.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemsFavoriteAdapter());
  await Hive.openBox<ItemsFavorite>(HiveDB.favorite);
  initGetIt();
  runApp(const AkelniApp());
}
