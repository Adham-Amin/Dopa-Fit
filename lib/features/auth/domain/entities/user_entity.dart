import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String uId;
  final String name;
  final String email;
  final String? planId;
  final String? workoutPlanId;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    this.planId,
    this.workoutPlanId,
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
      if (workoutPlanId != null) 'workoutPlanId': workoutPlanId
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> json) {
    return UserEntity(
      uId: json['uId'],
      name: json['name'],
      email: json['email'],
      planId: json['planId'],
      workoutPlanId: json['workoutPlanId'],
    );
  }

  UserEntity copyWith({
    String? uId,
    String? name,
    String? email,
    String? planId,
    String? workoutPlanId,
  }) {
    return UserEntity(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      planId: planId ?? this.planId,
      workoutPlanId: workoutPlanId ?? this.workoutPlanId,
    );
  }
}
