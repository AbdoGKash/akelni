import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/items_widget/akelni_item.dart';
import '../../widget/items_widget/items_app_bar.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItemsAppBar(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 20, 20).w,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return const AkelniItem();
              })),
    );
  }
}
