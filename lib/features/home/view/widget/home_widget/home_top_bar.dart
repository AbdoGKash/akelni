import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Abdo!".tr(context),
              style: TextStyles.font24BlackBold,
            ),
            Text(
              "How are you Today ?".tr(context),
              style: TextStyles.font14Gray200,
            )
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: ColorsManager.ligtherGrey,
          radius: 25,
          child: SvgPicture.asset(ImagesAssets.notifications),
        )
      ],
    );
  }
}
