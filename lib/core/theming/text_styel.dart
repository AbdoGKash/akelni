import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle font24primaryBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primary,
  );

  static TextStyle font32primaryBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.primary,
  );

  static TextStyle font13primary300 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: ColorsManager.primary,
  );
  static TextStyle font13BlackBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.black,
  );
  static TextStyle font13BlackW300 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: ColorsManager.black,
  );
  static TextStyle font14Gray200 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w200,
    color: ColorsManager.grey,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w800,
    color: ColorsManager.white,
  );
}
