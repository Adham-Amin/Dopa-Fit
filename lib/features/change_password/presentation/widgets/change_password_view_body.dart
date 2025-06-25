import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/custom_pass_text_from_field.dart';
import 'package:dopa_fit/features/auth/presentation/widgets/title_text_field.dart';
import 'package:dopa_fit/features/change_password/presentation/manager/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  late String currentPassword;
  late String newPassword;
  late String confirmPassword;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Password changed successfully',
                style: AppStyles.textRegular16(
                  context,
                ).copyWith(color: AppColors.white),
              ),
            ),
          );
          Navigator.pop(context);
        } else if (state is ChangePasswordFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                   SizedBox(height: 12.h),
                  const TitleTextField(title: 'Current Password'),
                   SizedBox(height: 4.h),
                  CustomPassTextFromField(
                    onSaved: (data) => currentPassword = data!,
                    hintText: 'Enter current password',
                  ),
                   SizedBox(height: 16.h),
                  const TitleTextField(title: 'New Password'),
                   SizedBox(height: 4.h),
                  CustomPassTextFromField(
                    onSaved: (data) => newPassword = data!,
                    hintText: 'Enter new password',
                  ),
                   SizedBox(height: 16.h),
                  const TitleTextField(title: 'Confirm Password'),
                   SizedBox(height: 4.h),
                  CustomPassTextFromField(
                    onSaved: (data) => confirmPassword = data!,
                    hintText: 'Enter confirm password',
                  ),
                   SizedBox(height: 32.h),
                  state is ChangePasswordLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                        title: 'Save',
                        onTap: () {
                          changePass(context);
                        },
                        iconWidget: Icon(
                          Icons.save_outlined,
                          color: AppColors.red,
                          size: 24.w,
                        ),
                      ),
                   SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void changePass(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (newPassword != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Passwords do not match',
              style: AppStyles.textRegular16(context),
            ),
          ),
        );
      } else {
        context.read<ChangePasswordCubit>().changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
      }
    }
  }
}
