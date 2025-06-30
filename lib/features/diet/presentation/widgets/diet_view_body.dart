import 'package:dopa_fit/core/functions/launch_link.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/diet/presentation/manager/cubit/diet_cubit.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/macros_row.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/meals_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietViewBody extends StatefulWidget {
  const DietViewBody({super.key});

  @override
  State<DietViewBody> createState() => _DietViewBodyState();
}

class _DietViewBodyState extends State<DietViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<DietCubit>().getMeals();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12.h),
            BlocBuilder<DietCubit, DietState>(
              builder: (context, state) {
                if (state is DietError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: AppStyles.textSemiBold14(context),
                    ),
                  );
                } else if (state is DietLoaded) {
                  return Column(
                    children: [
                      MacrosRow(meal: state.diets),
                      Divider(
                        thickness: 1,
                        color: AppColors.grey,
                        height: 48.h,
                      ),
                      MealsGrid(meals: state.diets.meals),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.red),
                );
              },
            ),
            Divider(thickness: 1, color: AppColors.grey, height: 48.h),
            CustomButton(
              onTap: () {
                launchLink(
                  context,
                  'https://www.kvcc.edu/communityculinary/KCMH_Cookbook_KT_Final_11-6_NoCrops-compressed.pdf',
                );
              },
              title: 'E-Cooking Book',
              iconWidget: const Icon(
                Icons.menu_book_outlined,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
