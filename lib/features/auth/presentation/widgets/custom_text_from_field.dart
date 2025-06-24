import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.onSaved,
  });

  final String hintText;
  final Widget? icon;
  final String? Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.textRegular16(context).copyWith(color: AppColors.black),
      onSaved: onSaved,
      validator: (value) => value!.isEmpty ? 'Enter your email address' : null,
      cursorColor: AppColors.red,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon:
            icon ??
            SizedBox(
              width: 24,
              child: Center(
                child: SvgPicture.asset(AppAssets.imagesIconEmail, width: 24),
              ),
            ),
        fillColor: AppColors.white,
        filled: true,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
