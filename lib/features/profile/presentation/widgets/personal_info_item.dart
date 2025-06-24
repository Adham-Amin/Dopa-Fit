import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem({super.key, required this.labal, required this.value});

  final String labal;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labal,
          style: AppStyles.textBold14(context).copyWith(color: AppColors.white),
        ),
        SizedBox(
          width: double.infinity,
          child: CustomContainer(
            vertical: 12,
            child: Text(
              value,
              style: AppStyles.textRegular14(
                context,
              ).copyWith(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}