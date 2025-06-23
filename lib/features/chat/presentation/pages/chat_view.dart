import 'package:dopa_fit/core/widgets/custom_bkground.dart';
import 'package:dopa_fit/features/chat/presentation/manager/chat_cubit.dart';
import 'package:dopa_fit/features/chat/presentation/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ChatCubit(),
          child: CustomBackground(child: ChatViewBody()),
        ),
      ),
    );
  }
}
