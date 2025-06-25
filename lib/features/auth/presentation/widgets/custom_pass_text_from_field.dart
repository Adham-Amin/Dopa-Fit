import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class CustomPassTextFromField extends StatefulWidget {
  const CustomPassTextFromField({super.key, this.onSaved, this.hintText});

  final void Function(String?)? onSaved;
  final String? hintText;

  @override
  State<CustomPassTextFromField> createState() =>
      _CustomPassTextFromFieldState();
}

class _CustomPassTextFromFieldState extends State<CustomPassTextFromField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.textRegular16(context).copyWith(color: AppColors.black),
      onSaved: widget.onSaved,
      validator: (value) => value!.isEmpty ? 'Enter your password' : null,
      obscureText: isObscure,
      cursorColor: AppColors.red,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () => setState(() => isObscure = !isObscure),
          icon: Icon(
            isObscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.grey,
          ),
        ),
        prefixIcon: SizedBox(
          width: 24.w,
          child: Center(
            child: SvgPicture.asset(AppAssets.imagesIconLock, width: 24.w),
          ),
        ),
        fillColor: AppColors.white,
        filled: true,
        hintText:widget.hintText ?? 'Enter your password',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 2.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
