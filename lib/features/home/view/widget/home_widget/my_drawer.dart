// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';

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
            title: 'My Profile',
            onTap: () {},
          ),
          buildDrawerListItemsDivider(),
          const ChangeLangBloc(),
          buildDrawerListItemsDivider(),
          const BuildDrawerListItem(leadingIcon: Icons.help, title: 'Help'),
          buildDrawerListItemsDivider(),
          const ChangeThemeBloc(),
          const BuildDrawerListItem(
            leadingIcon: Icons.logout,
            title: 'Logout',
            trailing: SizedBox(),
          ),
          const SizedBox(
            height: 90,
          ),
          ListTile(
            leading: Text(
              'Follow us',
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
