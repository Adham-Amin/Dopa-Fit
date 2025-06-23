import 'package:dopa_fit/core/widgets/custom_app_bar.dart';
import 'package:dopa_fit/features/chat/presentation/manager/chat_cubit.dart';
import 'package:dopa_fit/features/chat/presentation/manager/chat_state.dart';
import 'package:dopa_fit/features/chat/presentation/widgets/animated_message.dart';
import 'package:dopa_fit/features/chat/presentation/widgets/chat_text_field.dart';
import 'package:dopa_fit/features/chat/presentation/widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final controller = TextEditingController();
  final scrollController = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(title: 'Chat Bot'),
              IconButton(
                onPressed: () {
                  context.read<ChatCubit>().clearChat();
                },
                icon: Icon(Icons.delete_outline, size: 24, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                scrollToBottom();
              },
              builder: (context, state) {
                final messages =
                    state is ChatLoaded || state is ChatLoading
                        ? (state as dynamic).messages
                        : [];
                final isLoading = state is ChatLoading;

                return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ...messages.map(
                        (msg) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AnimatedMessage(
                            message: msg.text,
                            isMe: msg.isUserMessage,
                            isError: msg.isError,
                          ),
                        ),
                      ),

                      if (isLoading)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: TypingIndicator(),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12),
          ChatTextField(
            controller: controller,
            onSend: (text) {
              context.read<ChatCubit>().sendMessage(text);
            },
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}