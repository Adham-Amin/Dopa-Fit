import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/workout_view_body.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  static const routeName = '/workout';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(body: CustomBackground(child: WorkoutViewBody())),
    );
  }
}
