import 'package:dopa_fit/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = '/profileView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const Scaffold(body: ProfileViewBody()));
  }
}