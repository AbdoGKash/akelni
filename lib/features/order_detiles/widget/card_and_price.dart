// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';

import '../../../core/helper/app_strings.dart';

class Cart extends StatelessWidget {
  final Items items;
  const Cart({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Price(label: AppStrings.price, price: items.price.toString()),
        Price(label: AppStrings.delivery, price: AppStrings.deliveryPrice),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Divider(color: ColorsManager.primary),
        ),
        Price(
            label: AppStrings.totalPrice,
            price: "${items.price! + 10}",
            color: ColorsManager.primary),
      ],
    );
  }
}

class Price extends StatelessWidget {
  final String price;
  final String label;
  Color? color;
  Price({super.key, required this.price, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          "$price \$",
          style: TextStyles.font16RedBold,
        )
      ],
    );
  }
}
