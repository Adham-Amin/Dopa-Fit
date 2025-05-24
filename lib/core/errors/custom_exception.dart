class CustomException {
  final String message;

  CustomException({required this.message});

  @override
  String toString() => message;
}