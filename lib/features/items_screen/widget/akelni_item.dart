import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/helper/app_strings.dart';
import '../../../core/helper/images_assets.dart';
import '../../../core/routing/routers_name.dart';
import '../../../core/theming/text_styel.dart';
import '../../favorite/hive.dart';

class AkelniItems extends StatefulWidget {
  final List<Items>? items;

  AkelniItems({
    super.key,
    this.items,
  });

  @override
  State<AkelniItems> createState() => _AkelniItemsState();
}

class _AkelniItemsState extends State<AkelniItems> {
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
    return ValueListenableBuilder(
      valueListenable: Hive.box<ItemsFavorite>('favor').listenable(),
      builder: (context, Box<ItemsFavorite> box, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.items!.length,
          itemBuilder: (BuildContext context, int index) {
            var item = widget.items![index];
            final isFavorite = box.containsKey(index);
            // final _isFavorite = box.get(index) != null;
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutersName.itemsDetilsScreen,
                    arguments: widget.items![index]);
              },
              child: Padding(
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
                              image: item.image.toString(),
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
                                          text: "${item.title} \n".tr(context),
                                          style:
                                              TextStyles.font16WhiteSemiBold),
                                      TextSpan(
                                          text: '${item.price}'.tr(context),
                                          style:
                                              TextStyles.font16WhiteSemiBold),
                                      TextSpan(
                                          text: " \$",
                                          style:
                                              TextStyles.font16WhiteSemiBold),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    if (isFavorite) {
                                      await box.delete(index);

                                      const snackBar = SnackBar(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(AppStrings
                                                .removedFromFavorites),
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      await box.put(
                                          index,
                                          ItemsFavorite(
                                              id: item.id,
                                              title: item.title,
                                              price: item.price,
                                              image: item.image));

                                      const snackBar = SnackBar(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(AppStrings
                                                .successfullyAddedToFavorites),
                                            Icon(
                                              Icons.done_outline_sharp,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        backgroundColor: Colors.blue,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      // setState(() {});
                                    }
                                  },
                                  icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: ColorsManager.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}


// Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20.0).w,
//         child: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, RoutersName.itemsDetilsScreen,
//                 arguments: widget.item);
//       },
//       child: _isLoading
//           ? Image.asset(
//               ImagesAssets.loading,
//               width: double.infinity,
//               height: double.infinity,
//               fit: BoxFit.cover,
//             )
//           : GridTile(
//               child: Container(
//                 color: ColorsManager.grey,
//                 child: FadeInImage.assetNetwork(
//                   width: double.infinity,
//                   height: double.infinity,
//                   placeholder: ImagesAssets.loading,
//                   image: widget.item.image.toString(),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               footer: Container(
//                 width: double.infinity,
//                 padding:
//                     EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
//                 color: ColorsManager.primary,
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                               text: "${widget.item.title} \n".tr(context),
//                               style: TextStyles.font16WhiteSemiBold),
//                           TextSpan(
//                               text: '${widget.item.price}'.tr(context),
//                               style: TextStyles.font16WhiteSemiBold),
//                           TextSpan(
//                               text: " \$",
//                               style: TextStyles.font16WhiteSemiBold),
//                         ],
//                       ),
//                     ),
// IconButton(
//           onPressed: () async {
//         ScaffoldMessenger.of(context).clearSnackBars();
//         if (widget.isFavorite) {
//           await box.delete(index);
//           const snackBar = SnackBar(
//             content: Text("removed"),
//             backgroundColor: Colors.red,
//           );
//           ScaffoldMessenger.of(context)
//               .showSnackBar(snackBar);
//         } else {
//           await box.put(widget.items![index].id,
//               widget.items![index].title);
//           const snackBar = SnackBar(
//             content: Text("sucess"),
//             backgroundColor: Colors.blue,
//           );
//           ScaffoldMessenger.of(context)
//               .showSnackBar(snackBar);
//         }
//       },
//       icon: Icon(
//           widget.isFavorite
//               ? Icons.favorite
//               : Icons.favorite_outline,
//           color: ColorsManager.red),
// ),
//                   ],
//                 ),
//               ),
//             ),
//     ),
//   ),
// );
