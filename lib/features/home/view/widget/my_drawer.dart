// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/app_strings.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../core/routing/routers_name.dart';
import 'build_drawer_header.dart';
import 'build_drawer_list_item.dart';
import 'build_drawer_social_media_icons.dart';
import 'change_lang_bloc.dart';
import 'change_theme_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 280,
            child: DrawerHeader(
              decoration: BoxDecoration(color: ColorsManager.primary),
              child: const BuildDrawerHeader(),
            ),
          ),
          const ChangeLangBloc(),
          buildDrawerListItemsDivider(),
          buildDrawerListItemsDivider(),
          const ChangeThemeBloc(),
          buildDrawerListItemsDivider(),
          BuildDrawerListItem(
            leadingIcon: Icons.help,
            title: AppStrings.help.tr(context),
          ),
          buildDrawerListItemsDivider(),
          BuildDrawerListItem(
            leadingIcon: Icons.logout,
            title: AppStrings.logout.tr(context),
            trailing: const SizedBox(),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
          SizedBox(
            height: 120.h,
          ),
          ListTile(
            leading: Text(
              AppStrings.followUs.tr(context),
              style: TextStyles.font14Gray200,
            ),
          ),
          const BuildDrawerSocialMediaIcons(),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.white,
          title: Text(
            AppStrings.warning,
            style: TextStyles.font18primaryBold.copyWith(fontSize: 20),
          ),
          content: Text(
            AppStrings.doYouWantToLogout,
            style: TextStyles.font20BlackBold,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.no,
                style: TextStyles.font18primaryBold.copyWith(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, RoutersName.login);
              },
              child: Text(
                AppStrings.yes,
                style: TextStyles.font20BlackBold,
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget buildDrawerListItemsDivider() {
  return const Divider(
    height: 0,
    thickness: 1,
    indent: 18,
    endIndent: 24,
  );
}
