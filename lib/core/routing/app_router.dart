import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/injection.dart';
import 'package:flutter_application_1/features/home/home_screen.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/features/sign_up/view/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/onboarding/oboarding_screen.dart';
import 'routers_name.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutersName.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OboardingScreen(),
        );
      case RoutersName.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case RoutersName.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case RoutersName.homeSreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}
