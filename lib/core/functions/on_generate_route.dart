import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/auth/presentation/views/signup_view.dart';
import 'package:dopa_fit/features/diet/presentation/views/diet_view.dart';
import 'package:dopa_fit/features/home/presentation/views/home_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:dopa_fit/features/questions/presentation/views/question_view.dart';
import 'package:dopa_fit/features/splash/presentation/views/splash_view.dart';
import 'package:dopa_fit/features/workout/presentation/views/workout_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case QuestionView.routeName:
      return MaterialPageRoute(builder: (context) => const QuestionView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case DietView.routeName:
      return MaterialPageRoute(builder: (context) => const DietView());
    case WorkoutView.routeName:
      return MaterialPageRoute(builder: (context) => const WorkoutView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
