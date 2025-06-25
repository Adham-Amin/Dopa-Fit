import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/auth/presentation/manager/signin_cubits/signin_cubit.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_pass_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/header_auth.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String name, email, password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                HeaderAuth(subtitle: 'Quickly make your account in 1 minute.'),
                SizedBox(height: 20.h),
                TitleTextField(title: 'Name'),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  onSaved: (data) => name = data!,
                  hintText: 'Enter your name',
                ),
                SizedBox(height: 20.h),
                TitleTextField(title: 'Email Address'),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  onSaved: (data) => email = data!,
                  hintText: 'Enter your email address',
                ),
                SizedBox(height: 20.h),
                TitleTextField(title: 'Password'),
                SizedBox(height: 4.h),
                CustomPassTextFromField(onSaved: (pass) => password = pass!),
                SizedBox(height: 24.h),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().createUser(
                        email: email,
                        password: password,
                        name: name,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: 'Sign Up',
                  icon: AppAssets.imagesIconArrowRight,
                ),
                SizedBox(height: 32.h),
                CustomTestRich(
                  title: 'Already have an account? ',
                  subtitle: 'Sign In',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
