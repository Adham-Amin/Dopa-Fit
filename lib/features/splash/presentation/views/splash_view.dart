import 'package:dopa_fit/features/splash/presentation/widgets/splash_view_bodey.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SplashViewBody(),
    );
  }
}