import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        onPressed: () {},
        color: ColorsManager.primary,
        child: Text("Get Started", style: TextStyles.font16WhiteSemiBold),
      ),
    );
  }
}
