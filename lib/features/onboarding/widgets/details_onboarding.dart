import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/app_strings.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/text_styel.dart';
import 'custom_button_onbording.dart';

class DetailsOnBoarding extends StatelessWidget {
  const DetailsOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImagesAssets.onboardingSvg,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppStrings.orderForFood.tr(context),
              style: TextStyles.font32primaryBold,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppStrings.onboardingDescription.tr(context),
              textAlign: TextAlign.center,
            ),
            const CustomButtonOnBording()
          ],
        ),
      ),
    );
  }
}
