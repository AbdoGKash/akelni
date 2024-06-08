import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/images_assets.dart';

class AkelniCategoriesList extends StatelessWidget {
  const AkelniCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 50,
                    child: Image.asset(
                      ImagesAssets.offer,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text("Pizza")
                ],
              ),
            );
          }),
    );
  }
}
