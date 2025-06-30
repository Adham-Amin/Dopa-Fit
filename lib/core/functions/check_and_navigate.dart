// ignore_for_file: use_build_context_synchronously

import 'package:dopa_fit/core/services/firebase_auth_servies.dart';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/home/presentation/views/main_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:dopa_fit/features/questions/presentation/views/question_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkAndNavigate(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  int lastOpenMillis = prefs.getInt('last_question_page_open') ?? 0;
  final nowMillis = DateTime.now().millisecondsSinceEpoch;

  if (lastOpenMillis > nowMillis) {
    lastOpenMillis = 0;
  }

  const fourteenDaysMillis = 14 * 24 * 60 * 60 * 1000;

  if (lastOpenMillis != 0 && nowMillis - lastOpenMillis > fourteenDaysMillis) {
  await prefs.setInt('last_question_page_open', nowMillis);
  if (!context.mounted) return;
  Navigator.pushReplacementNamed(context, QuestionView.routeName);
  return; 
}


  final bool seenOnboarding = Prefs.getBool('seenOnboarding');
  final bool signedIn = FirebaseAuthServies.isSignedIn();

  if (!context.mounted) return;

  if (!seenOnboarding) {
    Navigator.pushReplacementNamed(context, OnboardingView.routeName);
  } else if (!signedIn) {
    Navigator.pushReplacementNamed(context, LoginView.routeName);
  } else {
    Navigator.pushReplacementNamed(context, MainView.routeName);
  }
}
