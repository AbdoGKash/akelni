import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/items_widget/items_app_bar.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItemsAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 20, 20).w,
        child: Text("data"),
      ),
    );
  }
}
