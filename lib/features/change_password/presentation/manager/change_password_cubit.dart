import 'package:dartz/dartz.dart';
import 'package:dopa_fit/core/errors/failure.dart';
import 'package:dopa_fit/features/change_password/data/repos/change_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;

  ChangePasswordCubit(this.changePasswordRepo) : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());

    Either<Failure, void> result = await changePasswordRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    result.fold(
      (failure) => emit(ChangePasswordFailure(failure.message)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }
}
