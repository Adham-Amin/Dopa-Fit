import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = '/profileView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Profile'),
        body: ProfileViewBody(),
      ),
    );
  }
}
