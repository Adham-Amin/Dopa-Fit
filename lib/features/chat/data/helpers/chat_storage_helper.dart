import 'dart:convert';
import 'package:dopa_fit/features/chat/data/models/chat_massage_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatStorageHelper {
  static const String _key = 'chat_messages';

  static Future<void> saveMessages(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonMessages = messages.map((m) => m.toJson()).toList();
    prefs.setString(_key, jsonEncode(jsonMessages));
  }

  static Future<List<ChatMessage>> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return [];
    final List decoded = jsonDecode(data);
    return decoded.map((m) => ChatMessage.fromJson(m)).toList();
  }

  static Future<void> clearMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}