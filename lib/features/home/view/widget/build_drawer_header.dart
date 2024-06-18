import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/text_styel.dart';

class BuildDrawerHeader extends StatelessWidget {
  const BuildDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          padding: const EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(ImagesAssets.me),
          ),
        ),
        Text('Abdo', style: TextStyles.font16WhiteSemiBold),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
