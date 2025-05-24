import 'dart:async';

import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigator();
  }

  void executeNavigator() {
    Timer(Duration(seconds: 3), () {
     if (Prefs.getBool('seenOnboarding')) {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
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
            style: AppStyles.textMedium16(
              context,
            ).copyWith(fontSize: 18, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
