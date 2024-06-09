import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkelniItem extends StatelessWidget {
  const AkelniItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8.w, 8.w, 8.w, 8.w),
      padding: EdgeInsetsDirectional.all(4.w),
      decoration: BoxDecoration(
        color: ColorsManager.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        child: Hero(
          tag: 1,
          child: Container(
              color: ColorsManager.grey,
              child: FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image:
                    "https://media.istockphoto.com/id/1351732902/photo/female-hands-of-a-pizza-baker-hold-a-freshly-baked-pizza-with-sausage-bacon-mushrooms.webp?b=1&s=170667a&w=0&k=20&c=myRnyHxwSrZHdbyaDMNVCOuouehNtrW7yXXTfe5wFaU=",
                fit: BoxFit.cover,
              )),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            'abdo',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: ColorsManager.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
