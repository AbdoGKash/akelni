import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/helper/app_strings.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/text_styel.dart';
import '../../core/widgets/app_text_button.dart';
import '../favorite/data/model/hive.dart';
import '../favorite/widget/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        textTitel: AppStrings.cart,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0).w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 550.h,
                child: ValueListenableBuilder(
                  valueListenable:
                      Hive.box<ItemsFavorite>(HiveDB.cart).listenable(),
                  builder: (context, box, child) {
                    final keys = box.keys.toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        final key = keys[index];
                        final cartItem = box.get(key);
                        return Card(
                          color: ColorsManager.white,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                          cartItem!.image.toString()))),
                              Expanded(
                                flex: 4,
                                child: ListTile(
                                  title: Text(
                                    cartItem.title.toString(),
                                    style: TextStyles.font20BlackBold,
                                  ),
                                  subtitle: Text(
                                    "${cartItem.price.toString()} \$",
                                    style: TextStyles.font20PrimaryBold,
                                  ),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await box.delete(key);
                                        const snackBar = SnackBar(
                                          content: Text(
                                              AppStrings.removedFromFavorites),
                                          backgroundColor: Colors.red,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: ColorsManager.red,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              AppTextButton(
                buttonText: AppStrings.completeOrder.tr(context),
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  // ToDo
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
