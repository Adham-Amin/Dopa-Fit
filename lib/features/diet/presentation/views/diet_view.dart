import 'package:dopa_fit/core/cubits/diet_cubit/diet_cubit.dart';
import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/features/diet/presentation/widgets/diet_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietView extends StatefulWidget {
  const DietView({super.key});

  static const routeName = '/diet';

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  @override
  void initState() {
    super.initState();
    final user = getUser();
    final diet = context.read<DietCubit>();
    diet.fetchDiet(planId: user.planId!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Diet Plan'),
        body: DietViewBody(),
      ),
    );
  }
}
