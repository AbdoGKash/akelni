import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/theme_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../chang_language_and_theme/chang_lang_cubit.dart';
import 'build_drawer_list_item.dart';

class ChangeThemeBloc extends StatelessWidget {
  const ChangeThemeBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildDrawerListItem(
      leadingIcon: Icons.language,
      title: 'Change Theme',
      onTap: () async {
        final selectedOption = await showMenu<String>(
          context: context,
          position: const RelativeRect.fromLTRB(50, 390, 200, 100),
          items: [
            const PopupMenuItem<String>(
              value: 'light',
              child: Text('light mode'),
            ),
            const PopupMenuItem<String>(
              value: 'dark',
              child: Text('dark mode'),
            ),
          ],
        );
        if (selectedOption == 'light') {
          context
              .read<ChangeLanguageAndThemeCubit>()
              .changeTheme(ThemeState.lightTheme);
        } else if (selectedOption == 'dark') {
          context
              .read<ChangeLanguageAndThemeCubit>()
              .changeTheme(ThemeState.darkTheme);
        }
      },
    );
  }
}
