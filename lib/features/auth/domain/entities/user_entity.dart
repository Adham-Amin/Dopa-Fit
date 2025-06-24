import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String uId;
  final String name;
  final String email;
  final String? planId;
  final String? workoutPlanId;
  final double? weight;
  final double? height;
  final double? calories;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    this.planId,
    this.workoutPlanId,
    this.weight,
    this.calories,
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
      if (planId != null) 'planId': planId,
      if (workoutPlanId != null) 'workoutPlanId': workoutPlanId,
      if (weight != null) 'weight': weight,
      if (calories != null) 'calories': calories,
      if (height != null) 'height': height,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> json) {
    return UserEntity(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      planId: json['planId'],
      workoutPlanId: json['workoutPlanId'],
      weight: (json['weight'] as num?)?.toDouble(),
      calories: (json['calories'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );
  }

  UserEntity copyWith({
    String? uId,
    String? name,
    String? email,
    String? planId,
    String? workoutPlanId,
    double? weight,
    double? calories,
    double? height,
  }) {
    return UserEntity(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      planId: planId ?? this.planId,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
      weight: weight ?? this.weight,
      calories: calories ?? this.calories,
      height: height ?? this.height,
    );
  }
}
