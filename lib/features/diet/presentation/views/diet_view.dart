import 'package:dopa_fit/features/diet/presentation/widgets/diet_view_body.dart';
import 'package:flutter/material.dart';

class DietView extends StatelessWidget {
  const DietView({super.key});

  static const routeName = '/diet';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DietViewBody(),
      ),
    );
  }
}
