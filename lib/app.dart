import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/theme_enum.dart';
import 'package:flutter_application_1/core/injection.dart';
import 'package:flutter_application_1/core/routing/app_router.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/language/app_localizations.dart';
import 'features/chang_language_and_theme/chang_lang_cubit.dart';

class AkelniApp extends StatelessWidget {
  const AkelniApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLanguageAndThemeCubit()
        ..getSavedLanguage()
        ..changeTheme(ThemeState.initialTheme),
      child: ScreenUtilInit(
        designSize: const Size(393, 852), // for figma
        minTextAdapt: true,
        child: BlocBuilder<ChangeLanguageAndThemeCubit,
            ChangeLanguageAndThemeState>(
          builder: (context, state) {
            ThemeData theme;
            // jhf ? cdfs : sdf  do this
            if (state is LightTheme) {
              theme = ThemeData.light();
            } else if (state is DarkTheme) {
              theme = ThemeData.dark();
            } else {
              theme = ThemeData.light();
            }
            Locale locale;
            if (state is ChageLocaleState) {
              locale = state.local;
            } else {
              locale = const Locale('en');
            }
            return MaterialApp(
              theme: theme,
              locale: locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              debugShowCheckedModeBanner: false,
              initialRoute: RoutersName.homeSreen,
              onGenerateRoute: AppRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/helper/theme_enum.dart';
// import 'package:flutter_application_1/core/routing/app_router.dart';
// import 'package:flutter_application_1/core/routing/routers_name.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'core/helper/language/app_localizations.dart';
// import 'features/chang_language_and_theme/chang_lang_cubit.dart';

// class AkelniApp extends StatelessWidget {
//   const AkelniApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ChangeLanguageAndThemeCubit()
//         ..getSavedLanguage()
//         ..changeTheme(ThemeState.initialTheme),
//       child: ScreenUtilInit(
//         designSize: const Size(393, 852), // for figma
//         minTextAdapt: true,
//         child: BlocBuilder<ChangeLanguageAndThemeCubit,
//             ChangeLanguageAndThemeState>(
//           builder: (context, state) {
//             if (state is ChageLocaleState) {
//               return MaterialApp(
//                 locale: state.local,
//                 supportedLocales: const [Locale('en'), Locale('ar')],
//                 localizationsDelegates: const [
//                   AppLocalizations.delegate,
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   GlobalCupertinoLocalizations.delegate
//                 ],
//                 debugShowCheckedModeBanner: false,
//                 initialRoute: RoutersName.homeSreen,
//                 onGenerateRoute: AppRouter.generateRoute,
//               );
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }
