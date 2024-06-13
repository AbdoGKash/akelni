import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';

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
              text: AppStrings.byLoggingYouAgreeToYou.tr(context),
              style: TextStyles.font13BlackW300),
          TextSpan(
              text: AppStrings.termsConditions.tr(context),
              style: TextStyles.font13BlackBold),
          TextSpan(
              text: AppStrings.and.tr(context),
              style: TextStyles.font13BlackW300.copyWith(height: 1.5)),
          TextSpan(
              text: AppStrings.privacyPolicy.tr(context),
              style: TextStyles.font13BlackBold),
        ]));
  }
}
