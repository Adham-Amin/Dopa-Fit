// ignore_for_file: use_build_context_synchronously
import 'package:dopa_fit/core/cubits/workout_cubit/workout_cubit.dart';
import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  @override
  void initState() {
    super.initState();
    final user = getUser();
    if (user.workoutPlanId != null) {
      context.read<WorkoutCubit>().fetchWorkout(planId: user.workoutPlanId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: HomeViewBody()));
  }
}
