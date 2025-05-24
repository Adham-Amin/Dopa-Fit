part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginLoaded extends LoginState {
  final UserEntity user;
  LoginLoaded({required this.user});
}

final class LoginError extends LoginState {
  final String failure;
  LoginError({required this.failure});
}