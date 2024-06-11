import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';

class BuildDrawerListItem extends StatelessWidget {
  final IconData leadingIcon;
  final Color? color;
  final String title;
  final Function()? onTap;
  final Widget? trailing;
  const BuildDrawerListItem(
      {super.key,
      required this.leadingIcon,
      this.color,
      required this.title,
      this.onTap,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color ?? ColorsManager.primary,
      ),
      title: Text(title),
      trailing: trailing ??
          Icon(
            Icons.arrow_right,
            color: ColorsManager.primary,
          ),
      onTap: onTap,
    );
  }
}
