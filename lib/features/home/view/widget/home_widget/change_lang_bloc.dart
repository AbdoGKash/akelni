import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../chang_language/chang_lang_cubit.dart';
import 'build_drawer_list_item.dart';

class ChangeLangBloc extends StatelessWidget {
  const ChangeLangBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangLangCubit, ChangLangState>(
      builder: (context, state) {
        if (state is ChageLocaleState) {
          return BuildDrawerListItem(
            leadingIcon: Icons.language,
            title: 'Change Language',
            onTap: () async {
              final selectedOption = await showMenu<String>(
                context: context,
                position: const RelativeRect.fromLTRB(50, 390, 200, 100),
                items: [
                  const PopupMenuItem<String>(
                    value: 'ar',
                    child: Text('Arabic'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'en',
                    child: Text('English'),
                  ),
                ],
              );
              if (selectedOption != null) {
                BlocProvider.of<ChangLangCubit>(context)
                    .changeLanguage(selectedOption);
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
