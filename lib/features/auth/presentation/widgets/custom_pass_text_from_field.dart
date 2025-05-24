import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomPassTextFromField extends StatefulWidget {
  const CustomPassTextFromField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<CustomPassTextFromField> createState() =>
      _CustomPassTextFromFieldState();
}

class _CustomPassTextFromFieldState extends State<CustomPassTextFromField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          width: 24,
          child: Center(
            child: SvgPicture.asset(AppAssets.imagesIconLock, width: 24),
          ),
        ),
        fillColor: AppColors.white,
        filled: true,
        hintText: 'Enter your password',
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
