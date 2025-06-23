import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

        // SvgPicture.asset(AppAssets.imagesProfileIcon),
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
              LoginView.routeName,
              (route) => false,
            );
          },
          icon: const Icon(Icons.logout, color: AppColors.white),
        ),
      ],
    );
  }
}