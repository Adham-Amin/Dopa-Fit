// ignore_for_file: use_build_context_synchronously

import 'package:dopa_fit/core/services/firebase_auth_servies.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/home/presentation/views/main_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:dopa_fit/features/questions/presentation/views/question_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> checkAndNavigate(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();

  // ✅ أول مرة يدخل التطبيق؟ روح للـ Onboarding
  final bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  if (!seenOnboarding) {
    await prefs.setBool('seenOnboarding', true);
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    return;
  }

  // ✅ لو ضغط على زر معين قبل كده يخليه يدخل صفحة الأسئلة عند التشغيل
  final goToQuestions = prefs.getBool('goToQuestions') ?? false;
  if (goToQuestions) {
    await prefs.setBool('goToQuestions', false); // Reset بعد أول دخول
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, QuestionView.routeName);
    return;
  }

  // ✅ لو عدى أكتر من 14 يوم من آخر مرة دخل فيها على صفحة الأسئلة
  int lastOpenMillis = prefs.getInt('last_question_page_open') ?? 0;
  final nowMillis = DateTime.now().millisecondsSinceEpoch;
  const fourteenDaysMillis = 14 * 24 * 60 * 60 * 1000;

  if (lastOpenMillis == 0 || nowMillis - lastOpenMillis > fourteenDaysMillis) {
    await prefs.setInt('last_question_page_open', nowMillis);
    if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, QuestionView.routeName);
    return;
  }

  // ✅ باقي الحالات: هل مسجل دخول ولا لأ
  final bool signedIn = FirebaseAuthServies.isSignedIn();

  if (!context.mounted) return;

  if (!signedIn) {
    Navigator.pushReplacementNamed(context, LoginView.routeName);
  } else {
    Navigator.pushReplacementNamed(context, MainView.routeName);
  }
}
