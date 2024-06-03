import 'package:flutter/material.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/onboarding/view/oboarding_screen.dart';
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
          builder: (_) => const LoginScreen(),
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
