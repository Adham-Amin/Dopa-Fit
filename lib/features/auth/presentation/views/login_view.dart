import 'package:dopa_fit/core/functions/bar_massage.dart';
import 'package:dopa_fit/core/services/get_it_sevices.dart';
import 'package:dopa_fit/features/auth/domain/repos/auth_repo.dart';
import 'package:dopa_fit/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepo>()),
        child: Builder(
          builder: (context) {
            return BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoaded) {
                  
                }
                else if (state is LoginError) {
                 showSnackBar(context, state.failure);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD( 
                  inAsyncCall: state is LoginLoading,
                  child: const LoginViewBody());
              },
            );
          },
        ),
      ),
    );
  }
}
