import 'package:dopa_fit/core/functions/bar_massage.dart';
import 'package:dopa_fit/core/services/get_it_sevices.dart';
import 'package:dopa_fit/features/auth/domain/repos/auth_repo.dart';
import 'package:dopa_fit/features/auth/presentation/manager/signin_cubits/signin_cubit.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SigninCubit(getIt.get<AuthRepo>()),
        child: Builder(
          builder: (context) {
            return BlocConsumer<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninLoaded) {
                  Navigator.of(context).pop();
                } else if (state is SigninError) {
                  showSnackBar(context, state.failure);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is SigninLoading,
                  child: SignupViewBody(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
