import 'package:dartz/dartz.dart';
import 'package:dopa_fit/core/errors/failure.dart';
import 'package:dopa_fit/features/change_password/data/repos/change_password_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordRepoImpl implements ChangePasswordRepo {
  final FirebaseAuth _auth;

  ChangePasswordRepoImpl(this._auth);

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null || user.email == null) {
        return Left(ServerFailure(message: 'No user logged in'));
      }

      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
