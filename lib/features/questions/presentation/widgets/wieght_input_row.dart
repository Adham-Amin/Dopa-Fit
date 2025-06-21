import 'package:flutter/material.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'custom_text_from_field_input.dart';

class WeightInputRow extends StatelessWidget {
  final Function(String?) onSaved;

  const WeightInputRow({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Enter Your Weight (kg) ?',
            style: AppStyles.textRegular16(context).copyWith(color: AppColors.white),
          ),
        ),
        Expanded(
          child: CustomTextFormFieldInput(onSaved: onSaved),
        ),
      ],
    );
  }
}
