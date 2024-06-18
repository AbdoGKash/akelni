import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'theming/colors.dart';
import 'theming/text_styel.dart';

snakBar(BuildContext context, String imageName, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyles.font16WhiteSemiBold,
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: Lottie.asset(imageName),
        )
      ],
    ),
    backgroundColor: ColorsManager.black.withOpacity(0.8),
    duration: const Duration(seconds: 2),
  ));
}
