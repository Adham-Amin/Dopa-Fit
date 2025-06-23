import 'package:dopa_fit/core/cubits/diet_cubit/diet_cubit.dart';
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
  void initState() {
    super.initState();
    final user = getUser();
    final workout = context.read<WorkoutCubit>();
    workout.fetchWorkout(planId: user.workoutPlanId!);
    final diet = context.read<DietCubit>();
    diet.fetchDiet(planId: user.planId!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: HomeViewBody()),
    );
  }
}
