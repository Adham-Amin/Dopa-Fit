import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String uId;
  final String name;
  final String email;
  final String? workoutPlanId;
  final double? weight;
  final double? height;
  final int? age;
  final String? gender;
  final String? activityLevel;
  final String? goal;
  final String? allergies;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    this.age,
    this.gender,
    this.workoutPlanId,
    this.weight,
    this.activityLevel,
    this.goal,
    this.allergies,
    this.height,
  });

  factory UserEntity.fromFirebase(User user) => UserEntity(
    uId: user.uid,
    name: user.displayName ?? '',
    email: user.email ?? '',
  );

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'activity_level': activityLevel,
      'goal': goal,
      'allergies': allergies,
      if (workoutPlanId != null) 'workoutPlanId': workoutPlanId,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> json) {
    return UserEntity(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      workoutPlanId: json['workoutPlanId'],
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      age: json['age'],
      gender: json['gender'],
      activityLevel: json['activity_level'],
      goal: json['goal'],
      allergies: json['allergies'],
    );
  }

  UserEntity copyWith({
    String? uId,
    String? name,
    String? email,
    String? workoutPlanId,
    double? weight,
    double? height,
    int? age,
    String? gender,
    String? activityLevel,
    String? goal,
    String? allergies,
  }) {
    return UserEntity(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      activityLevel: activityLevel ?? this.activityLevel,
      goal: goal ?? this.goal,
      allergies: allergies ?? this.allergies,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }
}
