import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: HomeViewBody(),
    );
  }
}