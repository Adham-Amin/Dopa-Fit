import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class WorkoutViewBody extends StatelessWidget {
  const WorkoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(height: 12),
          CustomAppBar(title: 'Workout Plans'),  
        ],
      ),
    );
  }
}