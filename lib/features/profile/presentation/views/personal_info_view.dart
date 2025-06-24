import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/features/profile/presentation/widgets/personal_info_view_body.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  static const routeName = '/personal-info';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(context, title: 'Personal Info'),
        body: PersonalInfoViewBody(),
      ),
    );
  }
}
