import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/text_styel.dart';

class BuildDrawerHeader extends StatelessWidget {
  const BuildDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
            child: Icon(
              FontAwesomeIcons.user,
              size: 70,
              color: ColorsManager.white,
            )),
        Text('Abdo', style: TextStyles.font16WhiteSemiBold),
        const SizedBox(
          height: 5,
        ),
        Text(
          'abdoflutter@gamil.com',
          style: TextStyles.font16WhiteSemiBold,
        )
      ],
    );
  }
}
