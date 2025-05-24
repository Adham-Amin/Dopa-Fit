import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.hintText, this.icon,
  });

  final String hintText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.red,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: icon ?? SizedBox(
          width: 24,
          child:  Center(
            child: SvgPicture.asset(
              AppAssets.imagesIconEmail,
              width: 24,
            ),
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
          borderSide: BorderSide(color: AppColors.orange, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}