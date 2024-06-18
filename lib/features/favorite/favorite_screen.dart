import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/app_strings.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/helper/images_assets.dart';
import '../../core/snakbar.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_styel.dart';
import 'data/model/hive.dart';
import 'widget/custom_app_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
    return Scaffold(
      appBar: const CustomAppBar(
        textTitel: AppStrings.favorite,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ItemsFavorite>(HiveDB.favorite).listenable(),
        builder: (context, box, child) {
          final keys = box.keys.toList();
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: keys.length,
            itemBuilder: (BuildContext context, int index) {
              final key = keys[index];
              final favoriteItem = box.get(key);
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0).w,
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
                              image: favoriteItem!.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          footer: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.w),
                            color: ColorsManager.primary,
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                              "${favoriteItem.title.toString()} \n"
                                                  .tr(context),
                                          style:
                                              TextStyles.font14WhiteSemiBold),
                                      TextSpan(
                                          text: favoriteItem.price.toString(),
                                          style:
                                              TextStyles.font14WhiteSemiBold),
                                      TextSpan(
                                          text: " \$",
                                          style:
                                              TextStyles.font14WhiteSemiBold),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await box.delete(key);
                                    snakBar(context, ImagesAssets.deleteLottie,
                                        AppStrings.removedFromFavorites);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
