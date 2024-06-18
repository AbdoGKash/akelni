import 'package:flutter/material.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/theming/text_styel.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: AppStrings.byLoggingYouAgreeToYou,
              style: TextStyles.font13GreykW300),
          TextSpan(
              text: AppStrings.termsConditions,
              style: TextStyles.font13BlackBold),
          TextSpan(
              text: AppStrings.and,
              style: TextStyles.font13GreykW300.copyWith(height: 1.5)),
          TextSpan(
              text: AppStrings.privacyPolicy,
              style: TextStyles.font13BlackBold),
        ]));
  }
}
