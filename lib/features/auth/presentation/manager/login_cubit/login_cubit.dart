import 'package:dopa_fit/features/auth/domain/entities/user_entity.dart';
import 'package:dopa_fit/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.loginUser(email: email, password: password);
    result.fold(
      (failure) => emit(LoginError(failure: failure.message)),
      (user) => emit(LoginLoaded(user: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.logoinWithGoogleUser();
    result.fold(
      (failure) => emit(LoginError(failure: failure.message)),
      (user) => emit(LoginLoaded(user: user)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.logoinWithFacebookUser();
    result.fold(
      (failure) => emit(LoginError(failure: failure.message)),
      (user) => emit(LoginLoaded(user: user)),
    );
  }
}
