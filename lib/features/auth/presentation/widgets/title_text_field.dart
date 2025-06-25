import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key, required this.title,
  });

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppStyles.textBold14(
          context,
        )
      ),
    );
  }
}