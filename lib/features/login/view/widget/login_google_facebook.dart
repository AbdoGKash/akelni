import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/helper/images_assets.dart';

class LoginGoogleFacebook extends StatelessWidget {
  const LoginGoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.center, child: Text(AppStrings.orSignUp)),
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
