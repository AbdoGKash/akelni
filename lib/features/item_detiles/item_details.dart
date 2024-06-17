import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/app_strings.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_text_button.dart';

class ItemDetails extends StatefulWidget {
  final Items item;
  const ItemDetails({super.key, required this.item});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width,
              child: Hero(
                tag: widget.item.id as Object,
                child: Image.network(
                  widget.item.image!,
                  fit: BoxFit.fill,
                ),
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
                        "${widget.item.title}".tr(context),
                        style: TextStyles.font20BlackBold,
                      ),
                      Row(
                        children: [
                          Text("${newPrice()}",
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
                  counterPrice()
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                widget.item.description.toString(),
                style: TextStyles.font13BlackW300,
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: AppTextButton(
                buttonText: AppStrings.ordered.tr(context),
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () async {
                  Navigator.pushNamed(context, RoutersName.orderDetiles,
                      arguments: widget.item);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget counterPrice() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: const Icon(Icons.add)),
        Text(
          "$counter",
          style: TextStyles.font20BlackBold,
        ),
        IconButton(
            onPressed: () {
              if (counter > 1) {
                setState(() {
                  counter--;
                });
              }
            },
            icon: const Icon(Icons.remove)),
      ],
    );
  }

  int newPrice() {
    return widget.item.price! * counter;
  }
}
