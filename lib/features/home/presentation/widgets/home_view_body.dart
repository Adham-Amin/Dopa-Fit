import 'package:dopa_fit/core/functions/get_user.dart';
import 'package:dopa_fit/core/utils/app_assets.dart';
import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:dopa_fit/features/auth/presentation/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        ListTile(
          leading: Image.asset(AppAssets.imagesBodybuilder, width: 50),
          title: Text(
            getUser().name,
            style: AppStyles.textBold14(
              context,
            ).copyWith(color: AppColors.white),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.logout, color: AppColors.white),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
