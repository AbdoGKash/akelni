import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/text_styel.dart';
import '../../data/model/home_model.dart';

class AkelniRecommendation extends StatelessWidget {
  final List<Items> foodItems;
  const AkelniRecommendation({super.key, required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10).w,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0).w,
                  child: Image.network(
                    foodItems[index].image!,
                    height: 100.0.h,
                    width: 100.0.w,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${foodItems[index].title}".tr(context),
                      style: TextStyles.font20BlackBold,
                    ),
                    Row(
                      children: [
                        Text(
                          "${foodItems[index].price}".tr(context),
                          style: TextStyles.font16RedBold,
                        ),
                        Text(
                          " \$",
                          style: TextStyles.font16RedBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
