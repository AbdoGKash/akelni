import 'package:flutter/material.dart';

import 'widgets/details_onboarding.dart';
import 'widgets/onboarding_main_image.dart';

class OboardingScreen extends StatelessWidget {
  const OboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          OnboardingMainImage(),
          Positioned(bottom: 0, child: DetailsOnBoarding()),
        ],
      ),
    ));
  }
}
