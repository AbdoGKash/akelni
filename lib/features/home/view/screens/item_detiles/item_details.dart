import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/app_text_button.dart';
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
                    builder: (BuildContext context) => PaypalCheckout(
                      sandboxMode: true,
                      clientId:
                          "AevwpbqkA6FCCwfYISqtqaj2P-lRG0RZUxXgRdi9r2Yg8tkKalpPDfaVe_ALzojFJVl0jbcJriYLRvYE",
                      secretKey:
                          "EL4oab11A9k1OA3VtCo2XOCSLTHDmq9neQemJpe9i4jjfcV8loxfEZc32cihFgVRJfNDoJ5sgyFcGH54",
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      transactions: [
                        {
                          "amount": {
                            "total": '${item.price}',
                            "currency": "USD",
                            "details": {
                              "subtotal": '${item.price}',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "${item.title}",
                                "quantity": 1,
                                "price": '${item.price}',
                                "currency": "USD"
                              },
                            ],

                            // shipping address is not required though
                            //   "shipping_address": {
                            //     "recipient_name": "Raman Singh",
                            //     "line1": "Delhi",
                            //     "line2": "",
                            //     "city": "Delhi",
                            //     "country_code": "IN",
                            //     "postal_code": "11001",
                            //     "phone": "+00000000",
                            //     "state": "Texas"
                            //  },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        Center(
                          child: Text("Done"),
                        );
                      },
                      onError: (error) {
                        print("onError: $error");
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                      },
                    ),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
