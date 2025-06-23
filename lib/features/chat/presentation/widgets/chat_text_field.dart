import 'package:dopa_fit/core/utils/app_colors.dart';
import 'package:dopa_fit/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String) onSend;

  const ChatTextField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 5,
      style: AppStyles.textRegular14(context),
      cursorColor: AppColors.red,
      cursorWidth: 2,
      controller: widget.controller,
      onChanged: (value) => setState(() => message = value),
      onSubmitted: (value) {
        if (message.trim().isNotEmpty) {
          widget.onSend(value.trim());
          widget.controller.clear();
          setState(() => message = '');
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.white,
        border: _border(AppColors.grey),
        enabledBorder: _border(AppColors.grey),
        focusedBorder: _border(AppColors.black, width: 2),
        hintText: 'Write your message',
        hintStyle: AppStyles.textRegular14(context),
        suffixIcon: IconButton(
          onPressed: message.trim().isEmpty
              ? null
              : () {
                  widget.onSend(message.trim());
                  widget.controller.clear();
                  setState(() => message = '');
                },
          icon: Icon(
            Icons.send,
            color: message.trim().isEmpty ? AppColors.grey : AppColors.black,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

