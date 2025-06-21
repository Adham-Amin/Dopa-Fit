import 'dart:convert';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  final jsonData =  Prefs.getString('userData');
  return UserEntity.fromMap(jsonDecode(jsonData));
}
