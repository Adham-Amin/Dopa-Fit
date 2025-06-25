import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/questions/presentation/views/question_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoAndProfileIcon extends StatelessWidget {
  const UserInfoAndProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Image.asset(AppAssets.imagesBodybuilder, width: 50.w),
        Text(
          getUser().name,
          style: AppStyles.textBold14(context)
        ),
        Spacer(),
        IconButton(
          onPressed:
              () => Navigator.of(context).pushNamed(QuestionView.routeName),
          icon: const Icon(
            Icons.upload_outlined,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
