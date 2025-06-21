import 'dart:developer';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/activity_level_selector.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/goal_selector.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/hieght_input_row.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/wieght_input_row.dart';
import 'package:flutter/material.dart';

class QuestionViewBody extends StatefulWidget {
  const QuestionViewBody({super.key});

  @override
  State<QuestionViewBody> createState() => _QuestionViewBodyState();
}

class _QuestionViewBodyState extends State<QuestionViewBody> {
  final _formKey = GlobalKey<FormState>();
  String height = '';
  String weight = '';
  String goal = 'maintain';
  String activityLevel = 'low';

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text('Calculate Calories', style: AppStyles.textBold20(context).copyWith(color: AppColors.white)),
              const SizedBox(height: 32),
              HeightInputRow(onSaved: (val) => height = val ?? ''),
              const SizedBox(height: 16),
              WeightInputRow(onSaved: (val) => weight = val ?? ''),
              const Divider(
                color: AppColors.orange,
                thickness: 1,
                height: 32,
                indent: 32,
                endIndent: 32,
              ),
              ActivityLevelSelector(
                selected: activityLevel,
                onSelected: (val) => setState(() => activityLevel = val),
              ),
              const Divider(
                color: AppColors.orange,
                thickness: 1,
                height: 32,
                indent: 32,
                endIndent: 32,
              ),
              GoalSelector(
                selected: goal,
                onSelected: (val) => setState(() => goal = val),
              ),
              const SizedBox(height: 32),
              CustomButton(
                title: 'Get Plans',
                icon: AppAssets.imagesIconArrowRight,
                onTap: caloriesCalculate,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void caloriesCalculate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final double? h = double.tryParse(height);
      final double? w = double.tryParse(weight);

      if (h != null && w != null) {
        double bmr = 10 * w + 6.25 * h - 5 * 25 + 5;
        double activityFactor =
            activityLevel == 'low'
                ? 1.3
                : activityLevel == 'medium'
                ? 1.4
                : 1.6;

        double calories = bmr * activityFactor;

        if (goal == 'gain') {
          calories += 500;
        } else if (goal == 'lose') {
          calories -= 500;
        }
        // cubit
        log(calories.toString());
      }
    }
  }
}
