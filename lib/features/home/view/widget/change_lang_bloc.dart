import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/app_strings.dart';
import '../../../chang_language_and_theme/chang_lang_cubit.dart';
import 'build_drawer_list_item.dart';

class ChangeLangBloc extends StatelessWidget {
  const ChangeLangBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildDrawerListItem(
      leadingIcon: Icons.language,
      title: AppStrings.changeLanguage.tr(context),
      onTap: () async {
        final selectedOption = await showMenu<String>(
          context: context,
          position: const RelativeRect.fromLTRB(50, 390, 200, 100),
          items: [
            PopupMenuItem<String>(
              value: 'ar',
              child: Text(AppStrings.arabic.tr(context)),
            ),
            PopupMenuItem<String>(
              value: 'en',
              child: Text(AppStrings.english.tr(context)),
            ),
          ],
        );
        if (selectedOption != null) {
          BlocProvider.of<ChangeLanguageAndThemeCubit>(context)
              .changeLanguage(selectedOption);
        }
      },
    );
  }
}
