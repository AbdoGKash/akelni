import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkelniRecommendation extends StatelessWidget {
  const AkelniRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  ImagesAssets.offer,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                children: [
                  Text("Pizza"),
                  Text("Price"),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
