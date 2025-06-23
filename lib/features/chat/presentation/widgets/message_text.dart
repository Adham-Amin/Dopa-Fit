import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    super.key,
    required this.isMe,
    required this.message,
    this.isError = false,
  });

  final bool isMe;
  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color:
                isError
                    ? Colors.red.shade100
                    : isMe
                    ? AppColors.red
                    : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(isMe ? 12 : 0),
              bottomRight: Radius.circular(isMe ? 0 : 12),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text(
            message,
            style: AppStyles.textRegular14(context).copyWith(
              color:
                  isError
                      ? Colors.red.shade800
                      : isMe
                      ? AppColors.white
                      : AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
