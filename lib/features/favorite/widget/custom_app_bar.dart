import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Favorites"),
      backgroundColor: ColorsManager.primary,
      centerTitle: true,
      foregroundColor: ColorsManager.white,
    );
  }

// for size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
