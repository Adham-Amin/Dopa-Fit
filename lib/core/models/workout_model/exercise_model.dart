class ExerciseModel {
  final String name;
  final String url;

  ExerciseModel({
    required this.name,
    required this.url,
  });

  factory ExerciseModel.fromFirestore(Map<String, dynamic> data) {
    return ExerciseModel(
      name: data['name'],
      url: data['url'],
    );
  }
}
