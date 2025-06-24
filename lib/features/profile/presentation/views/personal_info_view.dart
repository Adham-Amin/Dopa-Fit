import 'package:dopa_fit/features/profile/presentation/widgets/personal_info_view_body.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  static const routeName = '/personal-info';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const Scaffold(body: PersonalInfoViewBody()));
  }
}