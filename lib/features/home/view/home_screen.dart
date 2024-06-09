import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/images_assets.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_application_1/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_application_1/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/akelni_categories_list.dart';
import 'widget/akelni_recommendation.dart';
import 'widget/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const SizedBox(
                height: 20,
              ),
              Image.asset(ImagesAssets.offer),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Categories",
                style: TextStyles.font24BlackBold,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is Loading || current is Success,
                  builder: (context, state) {
                    return state.maybeWhen(loading: () {
                      return Center(
                          child: CircularProgressIndicator(
                        color: ColorsManager.primary,
                      ));
                    }, success: (homeData) {
                      var homeDataList = homeData.categories;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AkelniCategoriesList(
                            categories: homeDataList!,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Akelni Recommendation",
                            style: TextStyles.font24BlackBold,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AkelniRecommendation(
                            foodItems: homeDataList[0].items!,
                          )
                        ],
                      );
                    }, orElse: () {
                      return const SizedBox.shrink();
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
