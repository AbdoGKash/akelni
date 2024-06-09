import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styel.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import 'akelni_categories_list.dart';
import 'akelni_recommendation.dart';

class CategoriesAndItemsBlocBuilder extends StatelessWidget {
  const CategoriesAndItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
        });
  }
}
