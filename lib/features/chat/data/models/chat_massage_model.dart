class ChatMessage {
  final String text;
  final bool isUserMessage;
  final bool isError;
  final String? source;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
    this.isError = false,
    this.source,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'isUserMessage': isUserMessage,
        'isError': isError,
        'source': source,
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        text: json['text'],
        isUserMessage: json['isUserMessage'],
        isError: json['isError'] ?? false,
        source: json['source'],
      );
}