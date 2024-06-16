// import 'package:flutter/material.dart';

// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/helper/images_assets.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_styel.dart';
import 'hive.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<ItemsFavorite>('favor').listenable(),
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
              return GridTile(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
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
                                text: "${favoriteItem.title.toString()} \n"
                                    .tr(context),
                                style: TextStyles.font16WhiteSemiBold),
                            TextSpan(
                                text: favoriteItem.price.toString(),
                                style: TextStyles.font16WhiteSemiBold),
                            TextSpan(
                                text: " \$",
                                style: TextStyles.font16WhiteSemiBold),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await box.delete(key);
                          const snackBar = SnackBar(
                            content: Text("Removed from Favorites"),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );

          // return ListView.builder(
          //   itemCount: keys.length,
          //   itemBuilder: (context, index) {
          // final key = keys[index];
          // final value = box.get(key);
          //     return ListTile(
          //       title: Text(
          //           value!.price.toString()), // عرض القيمة المخزنة في الصندوق
          //       trailing: IconButton(
          // onPressed: () async {
          //   await box.delete(key);
          //   const snackBar = SnackBar(
          //     content: Text("Removed from Favorites"),
          //     backgroundColor: Colors.red,
          //   );
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // },
          // icon: const Icon(
          //   Icons.delete,
          //   color: Colors.red,
          // ),
          //  ),
          //     );
          //   },
          // );
        },
      ),
    );
  }
}



// https://chatgpt.com/share/4316f698-060a-4c17-91c7-7c691cdf5107