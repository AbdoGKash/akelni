import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_text_button.dart';
import '../../../../paypal/paypal_check_out.dart';
import '../../widget/item_detiles/counter_item.dart';

class ItemDetails extends StatelessWidget {
  final Items item;
  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              child: Image.network(
                item.image!,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${item.title}".tr(context),
                        style: TextStyles.font20BlackBold,
                      ),
                      Row(
                        children: [
                          Text("${item.price}".tr(context),
                              style: TextStyles.font16RedBold
                                  .copyWith(fontSize: 20)),
                          Text(" \$",
                              style: TextStyles.font16RedBold
                                  .copyWith(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CounterItem(),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: AppTextButton(
                buttonText: 'Ordered'.tr(context),
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const CheckoutPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
