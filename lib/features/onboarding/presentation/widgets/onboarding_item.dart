
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.bkgroundImage,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.buttonTitle,
    required this.onTap,
  });

  final String bkgroundImage;
  final Widget title;
  final String subtitle;
  final String icon;
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bkgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title,
          SizedBox(height: 12),
          Text(
            subtitle,
            style: AppStyles.textRegular16(
              context,
            ).copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 32),
          CustomButton(
            icon: icon,
            title: buttonTitle,
            onTap: onTap,
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
