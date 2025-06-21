import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldInput extends StatelessWidget {
  const CustomTextFormFieldInput({super.key, required this.onSaved});

  final Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) => value!.isEmpty ? 'Required' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      style: AppStyles.textRegular16(context).copyWith(color: AppColors.white),
      cursorColor: AppColors.white,
      cursorWidth: 1,
    );
  }
}