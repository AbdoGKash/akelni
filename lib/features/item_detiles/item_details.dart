import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/helper/app_strings.dart';
import '../../core/widgets/app_text_button.dart';
import '../favorite/data/model/hive.dart';
import 'widget/item_size.dart';

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
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        widget.item.description.toString(),
                        style: TextStyles.font13GreykW300,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Size",
                        style: TextStyles.font20BlackBold,
                      ),
                      const PizzaSizeSelector(),
                      SizedBox(
                        height: 50.h,
                      ),
                      ValueListenableBuilder(
                        valueListenable:
                            Hive.box<ItemsFavorite>(HiveDB.cart).listenable(),
                        builder: (context, Box<ItemsFavorite> box, child) {
                          var item = widget.item;
                          return Row(
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 230.w,
                                child: AppTextButton(
                                  buttonText: AppStrings.completeOrder,
                                  textStyle: TextStyles.font16WhiteSemiBold,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RoutersName.orderDetiles,
                                        arguments: widget.item);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              IconButton(
                                onPressed: () async {
                                  await box.put(
                                      item.id,
                                      ItemsFavorite(
                                          id: item.id,
                                          title: item.title,
                                          price: newPrice(),
                                          image: item.image));

                                  const snackBar = SnackBar(
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                            AppStrings.addedToCartSuccessfully),
                                        Icon(
                                          Icons.done_outline_sharp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 226, 78, 41),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(
                                  FontAwesomeIcons.cartShopping,
                                  color: ColorsManager.primary,
                                  size: 35,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
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
