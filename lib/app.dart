import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_router.dart';
import 'package:flutter_application_1/core/routing/routers_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkelniApp extends StatelessWidget {
  const AkelniApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(393, 852), // for figma
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutersName.homeSreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
