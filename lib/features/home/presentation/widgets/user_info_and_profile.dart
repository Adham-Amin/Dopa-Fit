import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class UserInfoAndProfileIcon extends StatelessWidget {
  const UserInfoAndProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Image.asset(AppAssets.imagesBodybuilder, width: 50),
        Text(
          getUser().name,
          style: AppStyles.textBold14(context).copyWith(color: AppColors.white),
        ),
        Spacer(),
        IconButton(
          onPressed:
              () => Navigator.of(context).pushNamed(ProfileView.routeName),
          icon: const Icon(
            Icons.person_outline_outlined,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
