import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styel.dart';

class ItemsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ItemsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.primary,
      centerTitle: true,
      foregroundColor: ColorsManager.white,
      title: Text(
        "List Food".tr(context),
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
