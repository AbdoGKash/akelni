import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_strings.dart';
import '../../../data/model/home_model.dart';
import '../../widget/items_widget/akelni_item.dart';
import '../../widget/items_widget/items_app_bar.dart';

class ItemsScreen extends StatelessWidget {
  final List<Items?>? items;
  const ItemsScreen({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ItemsAppBar(
        text: AppStrings.listFood.tr(context),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20).w,
          child: items!.isEmpty
              ? Center(
                  child: Text(
                  "Not Found".tr(context),
                  style: TextStyles.font32primaryBold,
                ))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: items!.length,
                  itemBuilder: (context, index) {
                    return AkelniItem(
                      items: items![index]!,
                    );
                  })),
    );
  }
}
