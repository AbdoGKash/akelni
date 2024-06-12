import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/app_strings.dart';
import '../../widget/home_widget/categories_and_items_bloc_builder.dart';
import '../../widget/home_widget/home_top_bar.dart';
import '../../widget/home_widget/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const SizedBox(
                height: 20,
              ),
              Image.asset(ImagesAssets.offer),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.categories.tr(context),
                style: TextStyles.font24BlackBold,
              ),
              const SizedBox(
                height: 10,
              ),
              const CategoriesAndItemsBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
