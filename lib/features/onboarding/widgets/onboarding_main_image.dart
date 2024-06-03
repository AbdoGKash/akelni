import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';

class OnboardingMainImage extends StatelessWidget {
  const OnboardingMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        ImagesAssets.onboardingImage,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
