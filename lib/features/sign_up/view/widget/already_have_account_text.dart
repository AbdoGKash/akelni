import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/app_strings.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styel.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: AppStrings.alreadyHaveAccount,
                style: TextStyles.font13GreykW300),
            TextSpan(
                text: AppStrings.login.tr(context),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RoutersName.login);
                  },
                style: TextStyles.font13BlackBold
                    .copyWith(color: ColorsManager.primary)),
          ])),
    );
  }
}
