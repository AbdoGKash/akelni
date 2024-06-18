import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitel;
  const CustomAppBar({super.key, required this.textTitel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(textTitel),
      backgroundColor: ColorsManager.primary,
      centerTitle: true,
      foregroundColor: ColorsManager.white,
    );
  }

// for size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
