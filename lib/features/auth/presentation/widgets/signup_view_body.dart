import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_pass_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/header_auth.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/title_text_field.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              HeaderAuth(subtitle: 'Quickly make your account in 1 minute.'),
              SizedBox(height: 20),
              TitleTextField(title: 'Name'),
              SizedBox(height: 4),
              CustomTextFormField(hintText: 'Enter your name'),
              SizedBox(height: 20),
              TitleTextField(title: 'Email Address'),
              SizedBox(height: 4),
              CustomTextFormField(hintText: 'Enter your email address'),
              SizedBox(height: 20),
              TitleTextField(title: 'Password'),
              SizedBox(height: 4),
              CustomPassTextFromField(),
              SizedBox(height: 24),
              CustomButton(
                onTap: () {},
                title: 'Sign Up',
                icon: AppAssets.imagesIconArrowRight,
              ),
              SizedBox(height: 32),
              CustomTestRich(
                title: 'Already have an account? ',
                subtitle: 'Sign In',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
