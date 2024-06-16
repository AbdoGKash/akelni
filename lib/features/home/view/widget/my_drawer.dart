// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/fav_test.dart';

import '../../../../../core/helper/app_strings.dart';
import '../../../../../core/theming/colors.dart';
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
          BuildDrawerListItem(
            leadingIcon: Icons.person,
            title: AppStrings.myProfile.tr(context),
            onTap: () {
              // Navigator.pushNamed(context, RoutersName.favoriteScreen);
            },
          ),
          buildDrawerListItemsDivider(),
          const ChangeLangBloc(),
          buildDrawerListItemsDivider(),
          BuildDrawerListItem(
            leadingIcon: Icons.help,
            title: AppStrings.help.tr(context),
          ),
          buildDrawerListItemsDivider(),
          const ChangeThemeBloc(),
          BuildDrawerListItem(
            leadingIcon: Icons.logout,
            title: AppStrings.logout.tr(context),
            trailing: const SizedBox(),
          ),
          const SizedBox(
            height: 90,
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

  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }
}
