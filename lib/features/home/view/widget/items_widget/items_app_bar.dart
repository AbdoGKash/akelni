import 'package:flutter/material.dart';

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
        "items",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
