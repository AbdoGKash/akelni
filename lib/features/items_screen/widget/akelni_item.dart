import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/features/home/data/model/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/helper/images_assets.dart';
import '../../../core/theming/text_styel.dart';
import '../../favorite/hive.dart';

class AkelniItems extends StatefulWidget {
  final List<Items>? items;
  const AkelniItems({super.key, this.items});

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
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0).w,
            child: InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, RoutersName.itemsDetilsScreen,
                  //     arguments: widget.item);
                },
                child: _isLoading
                    ? Image.asset(
                        ImagesAssets.loading,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : ValueListenableBuilder(
                        valueListenable:
                            Hive.box<ItemsFavorite>('favor').listenable(),
                        builder: (context, Box<ItemsFavorite> box, child) {
//                         return ListView.builder(
//                           itemCount: 5,
//                           itemBuilder: (context, index) {
//                             var item = widget.items![index];
//                             //إذا كان العنصر موجودًا في صندوق Hive باستخدام مفتاح id
//                             /*
//                             هذه الدالة تعود بقيمة true إذا كان الصندوق يحتوي على مفتاح item.id، مما يعني أن العنصر موجود في الصندوق (أي أنه في المفضلة).
// تعود بقيمة false إذا كان الصندوق لا يحتوي على مفتاح item.id، مما يعني أن العنصر غير موجود في الصندوق (أي أنه ليس في المفضلة).
//                             */
//                             final _isFavorite = box.containsKey(item.id);
//                             // var _isFavorite = box.get(item.id) != null;
//                             return ListTile(
//                               title:
//                                   Text(widget.items![index].title.toString()),
//                               trailing: IconButton(
//                                 onPressed: () async {
//                                   ScaffoldMessenger.of(context)
//                                       .clearSnackBars();
//                                   if (_isFavorite) // true لو موجود وانا ضغط يبقا عايز امسحه
//                                   {
//                                     await box.delete(item.id);
//                                     const snackBar = SnackBar(
//                                       content: Text("removed"),
//                                       backgroundColor: Colors.red,
//                                     );
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(snackBar);
//                                   } else {
//                                     await box.put(widget.items![index].id,
//                                         widget.items![index].title);
//                                     const snackBar = SnackBar(
//                                       content: Text("sucess"),
//                                       backgroundColor: Colors.blue,
//                                     );
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(snackBar);
//                                   }
//                                 },
//                                 icon: Icon(
//                                     _isFavorite
//                                         ? Icons.favorite
//                                         : Icons.favorite_outline,
//                                     color: ColorsManager.red),
//                               ),
//                             );
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                              final _isFavorite = box.containsKey(index);
                              // final _isFavorite = box.get(index) != null;
                              return GridTile(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "${item.title} \n"
                                                    .tr(context),
                                                style: TextStyles
                                                    .font16WhiteSemiBold),
                                            TextSpan(
                                                text:
                                                    '${item.price}'.tr(context),
                                                style: TextStyles
                                                    .font16WhiteSemiBold),
                                            TextSpan(
                                                text: " \$",
                                                style: TextStyles
                                                    .font16WhiteSemiBold),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          if (_isFavorite) {
                                            await box.delete(index);

                                            const snackBar = SnackBar(
                                              content: Text("removed"),
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
                                                    price:
                                                        item.price!.toDouble(),
                                                    image: item.image));

                                            const snackBar = SnackBar(
                                              content: Text("sucess"),
                                              backgroundColor: Colors.blue,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            // setState(() {});
                                          }
                                        },
                                        icon: Icon(
                                            _isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            color: ColorsManager.white),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ))));
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
