import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/app_strings.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routers_name.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/text_styel.dart';

class CustomButtonOnBording extends StatelessWidget {
  const CustomButtonOnBording({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        height: 40.h,
        minWidth: 280.w,
        onPressed: () {
          Navigator.pushReplacementNamed(context, RoutersName.login);
        },
        color: ColorsManager.primary,
        child: Text(AppStrings.getStarted.tr(context),
            style: TextStyles.font16WhiteSemiBold),
      ),
    );
  }
}
