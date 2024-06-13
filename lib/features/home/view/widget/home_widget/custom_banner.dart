import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_strings.dart';
import '../../../../../core/helper/images_assets.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styel.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 150.h,
      decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Row(
          children: [
            Image.asset(
              ImagesAssets.pizzaBanner,
              width: 80.w,
              height: 80.h,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              children: [
                Text(
                  AppStrings.offer.tr(context),
                  style: TextStyles.font24WhiteBold,
                ),
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  AppStrings.offerItems.tr(context),
                  style: TextStyles.font24WhiteBold,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
