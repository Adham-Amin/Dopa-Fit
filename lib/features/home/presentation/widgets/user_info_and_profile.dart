import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoAndProfileIcon extends StatelessWidget {
  const UserInfoAndProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Image.asset(AppAssets.imagesBodybuilder, width: 50.w),
        Text(getUser().name, style: AppStyles.textBold14(context)),
        Spacer(),
        IconButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setInt('last_question_page_open', 0);
          },

          icon: const Icon(Icons.upload_outlined, color: AppColors.white),
        ),
      ],
    );
  }
}
