import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/images_assets.dart';
import '../../../../core/theming/colors.dart';

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
                  CircleAvatar(
                    backgroundColor: ColorsManager.ligtherGrey,
                    radius: 25,
                    child: SvgPicture.asset(ImagesAssets.notifications),
                  )
                ],
              ),
            );
          }),
    );
  }
}
