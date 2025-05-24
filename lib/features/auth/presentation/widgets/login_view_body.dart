import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:dopa_fit/features/auth/presentation/views/signup_view.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_pass_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/header_auth.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/social_button.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                HeaderAuth(subtitle: 'Let’s personalize your fitness with AI.'),
                SizedBox(height: 20),
                TitleTextField(title: 'Email Address'),
                SizedBox(height: 4),
                CustomTextFormField(
                  onSaved: (data) => email = data!,
                  hintText: 'Enter your email address',
                ),
                SizedBox(height: 20),
                TitleTextField(title: 'Password'),
                SizedBox(height: 4),
                CustomPassTextFromField(onSaved: (pass) => password = pass!),
                SizedBox(height: 24),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<LoginCubit>().loginUser(
                      email: email,
                      password: password,
                    );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                  title: 'Sign In',
                  icon: AppAssets.imagesIconArrowRight,
                ),
                SizedBox(height: 40),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      onTap: () {
                        context.read<LoginCubit>().loginWithGoogle();
                      },
                      icon: AppAssets.imagesGoogleIcon,
                    ),
                    SocialButton(
                      onTap: () {
                        context.read<LoginCubit>().loginWithFacebook();
                      },
                      icon: AppAssets.imagesFacebookIcon,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                CustomTestRich(
                  onTap: () {
                    Navigator.pushNamed(context, SignupView.routeName);
                  },
                  title: 'Don’t have an account? ',
                  subtitle: 'Sign Up',
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot your password? ',
                    style: AppStyles.textMedium16(
                      context,
                    ).copyWith(color: AppColors.orange, fontSize: 14),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
