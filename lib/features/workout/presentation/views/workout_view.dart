import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/features/workout/presentation/widgets/workout_view_body.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  static const routeName = '/workout';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Workout Plan'),
        body: WorkoutViewBody(),
      ),
    );
  }
}
