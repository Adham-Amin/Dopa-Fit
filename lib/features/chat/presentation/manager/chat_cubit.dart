import 'package:dopa_fit/features/chat/data/helpers/chat_storage_helper.dart';
import 'package:dopa_fit/features/chat/data/models/chat_massage_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial()) {
    _loadChat();
  }

  final List<ChatMessage> _messages = [];

  final _model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: 'AIzaSyCiN5n3wIiGc94inJisT9Zj4QYqBVn6osg',
  );

  Future<void> _loadChat() async {
    emit(ChatLoading(messages: _messages));
    String welcomeMessage =
        "Hi! I'm FitBot, your smart fitness coach. How can I support your workouts or diet today?";
    const String prompt = '''
You are a fitness and nutrition assistant chatbot called "FitBot". Help the user with workout routines, nutrition advice, calorie calculations, supplements, bulking and cutting plans. Keep your answers short, practical, and easy to understand. Always reply in English unless the user writes in Arabic, then switch to Arabic.
''';

    final loaded = await ChatStorageHelper.loadMessages();
    _messages
      ..clear()
      ..addAll(loaded);
    if (_messages.isEmpty) {
      _messages.add(
        ChatMessage(text: '$welcomeMessage\n\n$prompt', isUserMessage: false),
      );
    }
    emit(ChatLoaded(List.from(_messages)));
  }

  Future<void> sendMessage(String text) async {
    _messages.add(ChatMessage(text: text, isUserMessage: true));
    emit(ChatLoaded(List.from(_messages)));

    try {
      emit(ChatLoading(messages: List.from(_messages)));

      final response = await _model.generateContent([Content.text(text)]);

      final reply =
          response.text ??
          "Sorry, I couldn't understand your question. Could you please rephrase it?";

      _messages.add(ChatMessage(text: reply, isUserMessage: false));
    } catch (e) {
      _messages.add(
        ChatMessage(text: 'Error: $e', isUserMessage: false, isError: true),
      );
    }

    await ChatStorageHelper.saveMessages(_messages);
    emit(ChatLoaded(List.from(_messages)));
  }

  Future<void> clearChat() async {
    await ChatStorageHelper.clearMessages();
    _messages.clear();
    _messages.add(
      ChatMessage(
        text:
            "Hi! I'm FitBot, your smart fitness coach. How can I support your workouts or diet today?",
        isUserMessage: false,
      ),
    );
    emit(ChatLoaded(List.from(_messages)));
  }
}
