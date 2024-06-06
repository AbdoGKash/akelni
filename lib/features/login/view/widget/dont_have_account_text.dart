import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_application_1/core/theming/colors.dart';

import '../../../../core/theming/text_styel.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Dont have account ? ",
                style: TextStyles.font13BlackW300),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, RoutersName.signUp);
                  },
                text: "Sign Up",
                style: TextStyles.font13BlackBold
                    .copyWith(color: ColorsManager.primary))
          ])),
    );
  }
}
