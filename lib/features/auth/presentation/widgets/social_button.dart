import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, this.onTap, required this.icon});

  final VoidCallback? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.white),
      ),
      child: IconButton(onPressed: onTap, icon: SvgPicture.asset(icon)),
    );
  }
}