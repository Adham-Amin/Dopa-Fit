// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:dopa_fit/core/functions/check_and_navigate.dart';
import 'package:dopa_fit/core/services/firebase_auth_servies.dart';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/home/presentation/views/main_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
    checkAndNavigate(context);
  });
  }

  void executeNavigator() {
    Timer(Duration(seconds: 3), () {
      if (Prefs.getBool('seenOnboarding')) {
        if (FirebaseAuthServies.isSignedIn()) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.imagesLogo, width: 210),
          const SizedBox(height: 20),
          Text(
            'Your personal fitness AI coach.',
            style: AppStyles.textMedium16(context).copyWith(fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
