import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_application_1/features/home/view/screens/item_detiles/item_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/images_assets.dart';
import '../../../../../core/theming/text_styel.dart';

class AkelniItem extends StatefulWidget {
  final Items items;
  const AkelniItem({super.key, required this.items});

  @override
  State<AkelniItem> createState() => _AkelniItemState();
}

class _AkelniItemState extends State<AkelniItem> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0).w,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ItemDetails(
                          item: widget.items,
                        )));
          },
          child: _isLoading
              ? Image.asset(
                  ImagesAssets.loading,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : GridTile(
                  child: Container(
                    color: ColorsManager.grey,
                    child: FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: ImagesAssets.loading,
                      image: widget.items.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.w),
                      color: ColorsManager.primary,
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "${widget.items.title} \n",
                                style: TextStyles.font16WhiteSemiBold),
                            TextSpan(
                                text: '${widget.items.price} \$',
                                style: TextStyles.font16WhiteSemiBold),
                          ]))),
                ),
        ),
      ),
    );
  }
}
