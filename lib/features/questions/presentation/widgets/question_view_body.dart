// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dopa_fit/core/cubits/workout_cubit/workout_cubit.dart';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/auth/domain/entities/user_entity.dart';
import 'package:dopa_fit/features/diet/data/models/diet_input_model.dart';
import 'package:dopa_fit/features/diet/presentation/manager/cubit/diet_cubit.dart';
import 'package:dopa_fit/features/home/presentation/views/main_view.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/activity_level_selector.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/age_input_row.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/custom_text_from_field_input.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/gender_selector.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/goal_selector.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/hieght_input_row.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/wieght_input_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionViewBody extends StatefulWidget {
  const QuestionViewBody({super.key});

  @override
  State<QuestionViewBody> createState() => _QuestionViewBodyState();
}

class _QuestionViewBodyState extends State<QuestionViewBody> {
  final _formKey = GlobalKey<FormState>();
  String height = '';
  String weight = '';
  String allergies = '';
  String goal = 'lose';
  String activityLevel = 'low';
  String gender = 'male';
  late int age;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Text('Calculate Calories', style: AppStyles.textBold20(context)),
            SizedBox(height: 32.h),
            AgeInputRow(onSaved: (val) => age = int.parse(val!)),
            SizedBox(height: 16.h),
            HeightInputRow(onSaved: (val) => height = val ?? ''),
            SizedBox(height: 16.h),
            WeightInputRow(onSaved: (val) => weight = val ?? ''),
            Divider(
              color: AppColors.red,
              thickness: 1,
              height: 32.h,
              indent: 32.w,
              endIndent: 32.w,
            ),
            GenderSelector(
              selected: gender,
              onSelected: (val) => setState(() => gender = val),
            ),
            SizedBox(height: 16.h),
            ActivityLevelSelector(
              selected: activityLevel,
              onSelected: (val) => setState(() => activityLevel = val),
            ),
            SizedBox(height: 16.h),
            GoalSelector(
              selected: goal,
              onSelected: (val) => setState(() => goal = val),
            ),
            Divider(
              color: AppColors.red,
              thickness: 1,
              height: 32.h,
              indent: 32.w,
              endIndent: 32.w,
            ),
            Text(
              'Do you have any food allergies? If yes, please specify them.',
              style: AppStyles.textRegular16(context),
            ),
            SizedBox(height: 8.h),
            CustomTextFormFieldInput(onSaved: (val) => allergies = val ?? ''),
            SizedBox(height: 32.h),
            CustomButton(
              title: 'Get Plans',
              icon: AppAssets.imagesIconArrowRight,
              onTap: getPlans,
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Future<void> getPlans() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final double w = double.parse(weight);
      final double h = double.parse(height);

      final workoutCubit = BlocProvider.of<WorkoutCubit>(context);
      final workoutPlanId = workoutCubit.getWorkoutPlanId(weight: w);

      BlocProvider.of<DietCubit>(context).getMeals(
        dietInput: DietInputModel(
          height: h,
          weight: w,
          age: age,
          gender: gender,
          activityLevel: activityLevel,
          goal: goal,
          allergies: allergies,
        ),
        forceRefresh: true,
      );

      final json = Prefs.getString('userData');
      if (json.isNotEmpty) {
        final user = UserEntity.fromMap(jsonDecode(json));
        final updatedUser = user.copyWith(
          age: age,
          gender: gender,
          activityLevel: activityLevel,
          goal: goal,
          allergies: allergies,
          height: h,
          weight: w,
          workoutPlanId: workoutPlanId,
        );

        FirebaseFirestore.instance.collection('users').doc(user.uId).update({
          'answeredQuestions': true,
        });

        Prefs.setString('userData', jsonEncode(updatedUser.toMap()));

        workoutCubit.updateUserWorkoutData(
          userId: user.uId,
          planId: workoutPlanId,
          weight: w,
        );
      }

      Prefs.setBool('Done Questions', true);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(
        'last_question_page_open',
        DateTime.now().millisecondsSinceEpoch,
      );

      Navigator.of(context).pushReplacementNamed(MainView.routeName);
    }
  }

  double calculateCalories(w, h) {
    double bmr = 10 * w + 6.25 * h - 5 * 25 + 5;

    double activityFactor = switch (activityLevel) {
      'low' => 1.3,
      'medium' => 1.4,
      _ => 1.6,
    };

    double calories = bmr * activityFactor;

    if (goal == 'gain') {
      calories += 500;
    } else if (goal == 'lose') {
      calories -= 500;
    }
    return calories;
  }
}
//   void caloriesCalculate() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       final double? h = double.tryParse(height);
//       final double? w = double.tryParse(weight);

//       if (h != null && w != null) {
//         double bmr = 10 * w + 6.25 * h - 5 * 25 + 5;

//         double activityFactor = switch (activityLevel) {
//           'low' => 1.3,
//           'medium' => 1.4,
//           _ => 1.6,
//         };

//         double calories = bmr * activityFactor;

//         if (goal == 'gain') {
//           calories += 500;
//         } else if (goal == 'lose') {
//           calories -= 500;
//         }
//         log('calories: $calories');
//         getPlansAndUpdateDataUserAndCheckNewUser(calories, w, h);

//         Prefs.setBool('Done Questions', true);

//         Navigator.of(context).pushReplacementNamed(MainView.routeName);
//       }
//     }
//   }

//   void getPlansAndUpdateDataUserAndCheckNewUser(double calories, double w, double h) async {
//     final dietCubit = BlocProvider.of<DietCubit>(context);
//     final workoutCubit = BlocProvider.of<WorkoutCubit>(context);
//     final planId = dietCubit.getPlan(calories: calories);
//     final workoutPlanId = workoutCubit.getWorkoutPlanId(weight: w);

//     final json = Prefs.getString('userData');
//     if (json.isNotEmpty) {
//       final user = UserEntity.fromMap(jsonDecode(json));
//       final updatedUser = user.copyWith(
//         height: h,
//         weight: w,
//         // planId: planId,
//         workoutPlanId: workoutPlanId,
//         calories: calories,
//       );
//       await FirebaseFirestore.instance.collection('users').doc(user.uId).update(
//         {'answeredQuestions': true},
//       );

//       Prefs.setString('userData', jsonEncode(updatedUser.toMap()));

//       dietCubit.updateUserPlanId(
//         userId: user.uId,
//         calories: calories,
//         height: h,
//       );
//       workoutCubit.updateUserWorkoutData(
//         userId: user.uId,
//         planId: workoutPlanId,
//         weight: w,
//       );
//     }
//   }
// }
