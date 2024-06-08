import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/akelni_categories_list.dart';
import 'widget/akelni_recommendation.dart';
import 'widget/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Categories",
                style: TextStyles.font24BlackBold,
              ),
              const SizedBox(
                height: 10,
              ),
              const AkelniCategoriesList(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Akelni Recommendation",
                style: TextStyles.font24BlackBold,
              ),
              const SizedBox(
                height: 10,
              ),
              const AkelniRecommendation()
            ],
          ),
        ),
      ),
    );
  }
}
