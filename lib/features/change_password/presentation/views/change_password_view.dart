import 'package:dopa_fit/core/services/get_it_sevices.dart';
import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/features/change_password/data/repos/change_password_repo.dart';
import 'package:dopa_fit/features/change_password/presentation/manager/change_password_cubit.dart';
import 'package:dopa_fit/features/change_password/presentation/widgets/change_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  static const routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get<ChangePasswordRepo>()),
      child: SafeArea(
        child: Scaffold(
          appBar: buildCustomAppBar(context, title: 'Change Password'),
          body: ChangePasswordViewBody(),
        ),
      ),
    );
  }
}
