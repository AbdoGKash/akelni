import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/helper/app_strings.dart';
import '../../core/theming/text_styel.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../home/data/model/home_model.dart';
import '../home/view/widget/items_widget/items_app_bar.dart';
import 'widget/card_and_price.dart';
import 'widget/coustom_card.dart';

class OrderDetiles extends StatelessWidget {
  final Items item;
  const OrderDetiles({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ItemsAppBar(
        text: AppStrings.orderDetiles.tr(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20).w,
          child: SingleChildScrollView(
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomCard(
                    name: item.title.toString(),
                    count: item.id.toString(),
                    image: item.image.toString()),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppStrings.enterAdressInformation.tr(context),
                  style: TextStyles.font20BlackBold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextFormField(
                  hintText: AppStrings.area.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnteArea.tr(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppTextFormField(
                  hintText: AppStrings.street.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterStreet.tr(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: AppStrings.homeNumber.tr(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterHomeNumber.tr(context);
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.circleCheck,
                      color: ColorsManager.primary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      AppStrings.paymentUsingPayPal.tr(context),
                      style: TextStyles.font20BlackBold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Cart(
                  items: item,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextButton(
                  buttonText: AppStrings.completeOrder.tr(context),
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutersName.checkout);
                  },
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
