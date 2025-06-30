import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/questions/presentation/widgets/custom_text_from_field_input.dart';
import 'package:flutter/material.dart';

class AgeInputRow extends StatelessWidget {
  const AgeInputRow ({super.key, required this.onSaved});
  final Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Enter Your Age ?',
            style: AppStyles.textRegular16(context),
          ),
        ),
        Expanded(child: CustomTextFormFieldInput(onSaved: onSaved)),
      ],
    );
  }
}
