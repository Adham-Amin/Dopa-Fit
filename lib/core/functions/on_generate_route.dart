import 'package:dopa_fit/core/models/workout_model/split_model.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:dopa_fit/features/auth/presentation/views/signup_view.dart';
import 'package:dopa_fit/features/change_password/presentation/views/change_password_view.dart';
import 'package:dopa_fit/features/chat/presentation/pages/chat_view.dart';
import 'package:dopa_fit/features/diet/presentation/views/diet_view.dart';
import 'package:dopa_fit/features/home/presentation/views/home_view.dart';
import 'package:dopa_fit/features/home/presentation/views/main_view.dart';
import 'package:dopa_fit/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:dopa_fit/features/profile/presentation/views/personal_info_view.dart';
import 'package:dopa_fit/features/profile/presentation/views/profile_view.dart';
import 'package:dopa_fit/features/questions/presentation/views/question_view.dart';
import 'package:dopa_fit/features/splash/presentation/views/splash_view.dart';
import 'package:dopa_fit/features/workout/presentation/views/workout_exercise_view.dart';
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
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case DietView.routeName:
      return MaterialPageRoute(builder: (context) => const DietView());
    case WorkoutView.routeName:
      return MaterialPageRoute(builder: (context) => const WorkoutView());
    case WorkoutExerciseView.routeName:
      return MaterialPageRoute(builder: (context) => WorkoutExerciseView(split: settings.arguments as SplitModel,));
    case ChatView.routeName:
      return MaterialPageRoute(builder: (context) => const ChatView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case PersonalInfoView.routeName:
      return MaterialPageRoute(builder: (context) => const PersonalInfoView());
    case ChangePasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ChangePasswordView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
