import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/helper/images_assets.dart';

class LoginGoogleFacebook extends StatelessWidget {
  const LoginGoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Text(AppStrings.orSignUp.tr(context))),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesAssets.googleSvg),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(ImagesAssets.facebookSvg)
          ],
        ),
      ],
    );
  }
}
