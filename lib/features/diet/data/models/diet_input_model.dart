class DietInputModel {
  final int age;
  final String gender;
  final double height;
  final double weight;
  final String activityLevel;
  final String goal;
  final String allergies;

  DietInputModel({
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.activityLevel,
    required this.goal,
    required this.allergies,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'activityLevel': activityLevel,
      'goal': goal,
      'allergies': allergies,
    };
  }
}
