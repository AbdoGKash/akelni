import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/app_strings.dart';
import '../../core/theming/text_styel.dart';
import '../../core/widgets/app_text_button.dart';
import '../../core/widgets/app_text_form_field.dart';
import '../home/data/model/home_model.dart';
import '../home/view/widget/items_widget/items_app_bar.dart';
import '../paypal/paypal_check_out.dart';
import 'widget/card_and_price.dart';
import 'widget/coustom_card.dart';

class OrderDetiles extends StatelessWidget {
  final Items item;
  const OrderDetiles({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ItemsAppBar(
        text: AppStrings.orderDetiles,
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
                  AppStrings.enterAdressInformation,
                  style: TextStyles.font20BlackBold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextFormField(
                  hintText: AppStrings.area,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnteArea;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppTextFormField(
                  hintText: AppStrings.street,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterStreet;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppTextFormField(
                  keyboardType: TextInputType.number,
                  hintText: AppStrings.homeNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterHomeNumber;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 130.h,
                ),
                Cart(
                  items: item,
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextButton(
                  buttonText: AppStrings.completeOrder,
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const CheckoutPage()));
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
