import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/text_styel.dart';
import '../../data/model/home_model.dart';

class AkelniCategoriesList extends StatelessWidget {
  final List<Categories?> categories;
  const AkelniCategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutersName.itemsScreen,
                          arguments: categories[index]!.items);
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(categories[index]!.image!),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "${categories[index]!.title}".tr(context),
                    style: TextStyles.font20BlackBold.copyWith(fontSize: 15),
                  )
                ],
              ),
            );
          }),
    );
  }
}
