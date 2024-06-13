import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/app_strings.dart';
import '../../../core/helper/images_assets.dart';
import '../../internet_connection/internet_connection_cubit.dart';
import 'widget/categories_and_items_bloc_builder.dart';
import 'widget/custom_banner.dart';
import 'widget/home_top_bar.dart';
import 'widget/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20).w,
          child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTopBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomBanner(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppStrings.categories.tr(context),
                    style: TextStyles.font24BlackBold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
                    builder: (context, state) {
                      if (state is ConnectedState) {
                        return const CategoriesAndItemsBlocBuilder();
                      } else if (state is NotConnectedState) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300.h,
                                width: 300.w,
                                child: Image.asset(ImagesAssets.noInternet),
                              ),
                              Text(
                                AppStrings.pleaseCheckInternet,
                                style: TextStyles.font16RedBold,
                              )
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
