import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/change_password/presentation/views/change_password_view.dart';
import 'package:dopa_fit/features/diet/presentation/views/diet_view.dart';
import 'package:dopa_fit/features/profile/presentation/views/personal_info_view.dart';
import 'package:dopa_fit/features/profile/presentation/widgets/profile_item.dart';
import 'package:dopa_fit/features/workout/presentation/views/workout_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 12.h,
          children: [
            SizedBox(height: 12.h),
            Image.asset(AppAssets.imagesBodybuilder, width: 100.w),
            Text(
              getUser().name,
              style: AppStyles.textBold20(context),
            ),
            SizedBox(height: 12.h),
            ProfileItem(
              onTap: () {
                Navigator.of(context).pushNamed(PersonalInfoView.routeName);
              },
              title: 'Personal Information',
              icon: Icons.person_2_outlined,
            ),
            ProfileItem(
              onTap: () {
                Navigator.of(context).pushNamed(ChangePasswordView.routeName);
              },
              title: 'Chane Password',
              icon: Icons.lock_outlined,
            ),
            ProfileItem(
              onTap: () {
                Navigator.of(context).pushNamed(DietView.routeName);
              },
              title: 'Diet Plan',
              icon: Icons.restaurant_outlined,
            ),
            ProfileItem(
              onTap: () {
                Navigator.of(context).pushNamed(WorkoutView.routeName);
              },
              title: 'Workout Plan',
              icon: Icons.fitness_center_outlined,
            ),
            ProfileItem(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginView.routeName,
                  (route) => false,
                );
              },
              title: 'Logout',
              icon: Icons.logout_outlined,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}