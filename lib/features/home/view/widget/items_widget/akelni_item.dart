import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/images_assets.dart';
import '../../../../../core/theming/text_styel.dart';

class AkelniItem extends StatelessWidget {
  final Items items;
  const AkelniItem({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8.w, 8.w, 8.w, 8.w),
      padding: EdgeInsetsDirectional.all(4.w),
      decoration: BoxDecoration(
        color: ColorsManager.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Container(
            color: ColorsManager.grey,
            child: FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: ImagesAssets.loading,
              image: items.image.toString(),
              fit: BoxFit.cover,
            )),
        footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
            color: Colors.black,
            alignment: Alignment.bottomCenter,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "${items.title} \n",
                      style: TextStyles.font16WhiteSemiBold),
                  TextSpan(
                      text: '${items.price} \$',
                      style: TextStyles.font16RedBold),
                ]))),
      ),
    );
  }
}
