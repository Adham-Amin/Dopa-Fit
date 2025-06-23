import 'package:dopa_fit/core/cubits/diet_cubit/diet_cubit.dart';
import 'package:dopa_fit/core/functions/launch_link.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/macros_row.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/meals_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietViewBody extends StatelessWidget {
  const DietViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const CustomAppBar(title: 'Diet Plans'),
            const SizedBox(height: 24),
            BlocBuilder<DietCubit, DietState>(
              builder: (context, state) {
                if (state is DietError) {
                  return Center(child: Text(state.message, style: AppStyles.textSemiBold14(context).copyWith(color: AppColors.white),));
                } else if (state is DietLoaded) {
                  return Column(
                    children: [
                      MacrosRow(diet: state.diets),
                      Divider(thickness: 1, color: AppColors.grey, height: 48,),
                      MealsGrid(meals: state.diets.meals),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            Divider(thickness: 1, color: AppColors.grey, height: 48,),
            CustomButton(
              onTap: () {
                launchLink(context, 'https://www.kvcc.edu/communityculinary/KCMH_Cookbook_KT_Final_11-6_NoCrops-compressed.pdf');
              },
              title: 'E-Cooking Book',
              iconWidget: const Icon(
                Icons.menu_book_outlined,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
