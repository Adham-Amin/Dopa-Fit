import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/auth/presentation/views/signup_view.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_pass_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_text_rich.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/header_auth.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/social_button.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/title_text_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderAuth(subtitle: 'Let’s personalize your fitness with AI.',),
              SizedBox(height: 20),
              TitleTextField(
                title: 'Email Address',
              ),
              SizedBox(height: 4),
              CustomTextFormField(
                hintText: 'Enter your email address',
              ),
              SizedBox(height: 20),
              TitleTextField(
                title: 'Password',
              ),
              SizedBox(height: 4),
              CustomPassTextFromField(),
              SizedBox(height: 24),
              CustomButton(
                onTap: () {
                  
                },
                title: 'Sign In',
                icon: AppAssets.imagesIconArrowRight,
              ),
              SizedBox(height: 40),
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(icon: AppAssets.imagesIconFacebook),
                  SocialButton(icon: AppAssets.imagesIconFacebook),
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
    );
  }
}