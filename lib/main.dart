import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/injection.dart';
import 'features/favorite/hive.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemsFavoriteAdapter());
  initGetIt();
  runApp(const AkelniApp());
}


// https://chatgpt.com/share/4316f698-060a-4c17-91c7-7c691cdf5107