import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/injection.dart';
import 'package:flutter_application_1/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_application_1/features/home/view/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/order_detiles/order_detiles.dart';
import 'package:flutter_application_1/features/paypal/paypal_check_out.dart';
import 'package:flutter_application_1/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/features/sign_up/view/sign_up_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/view/screens/items_screen/items_screen.dart';
import '../../features/internet_connection/internet_connection_cubit.dart';
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<HomeCubit>()..getHomeData(),
              ),
              BlocProvider(
                create: (context) =>
                    InternetConnectionCubit()..connectionInternet(),
                // getIt<InternetConnectionCubit>()..connectionInternet(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case RoutersName.items:
        // final items = settings.arguments as Items;
        return MaterialPageRoute(
          builder: (_) => const ItemsScreen(),
        );
      // case RoutersName.orderDetiles:
      //   return MaterialPageRoute(
      //     builder: (_) => const OrderDetiles(item: null,),
      //   );
      case RoutersName.checkout:
        return MaterialPageRoute(
          builder: (_) => const CheckoutPage(),
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
