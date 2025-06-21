import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dopa_fit/core/errors/custom_exception.dart';
import 'package:dopa_fit/core/errors/failure.dart';
import 'package:dopa_fit/core/services/firebase_auth_servies.dart';
import 'package:dopa_fit/core/services/firestoe_services.dart';
import 'package:dopa_fit/core/services/shared_preferences.dart';
import 'package:dopa_fit/core/utils/backend_endpoints.dart';
import 'package:dopa_fit/features/auth/domain/entities/user_entity.dart';
import 'package:dopa_fit/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServies firebaseServies;
  final FirestoeServices firestoeServices;
  AuthRepoImpl({required this.firestoeServices, required this.firebaseServies});

  @override
  Future<Either<Failure, UserEntity>> createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseServies.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserEntity userEntity = UserEntity(
        uId: user.uid,
        name: name,
        email: email,
      );

      await addUserData(user: userEntity, docId: user.uid);

      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUser(user);
      log("errorAuthRepoImpl: ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

  void deleteUser(User? user) {
    if (user != null) {
      firebaseServies.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseServies.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(docId: user.uid);
      await saveUserData(user: userEntity);
      return right(UserEntity.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("errorAuthRepoImpl: ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logoinWithFacebookUser() async {
    User? user;
    try {
      user = await firebaseServies.signInWithFacebook();
      final UserEntity userEntity = UserEntity.fromFirebase(user);
      await addUserData(user: userEntity, docId: user.uid);
      bool isExist = await firestoeServices.checkData(
        path: BackendEndpoints.users,
        docId: user.uid,
      );
      await isExistUser(isExist, userEntity, user);
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUser(user);
      log("errorAuthRepoImpl: ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logoinWithGoogleUser() async {
    User? user;
    try {
      user = await firebaseServies.signInWithGoogle();
      final UserEntity userEntity = UserEntity.fromFirebase(user);
      bool isExist = await firestoeServices.checkData(
        path: BackendEndpoints.users,
        docId: user.uid,
      );
      await isExistUser(isExist, userEntity, user);
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUser(user);
      log("errorAuthRepoImpl: ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> isExistUser(
    bool isExist,
    UserEntity userEntity,
    User user,
  ) async {
    if (!isExist) {
      await addUserData(user: userEntity, docId: user.uid);
    } else {
      await getUserData(docId: user.uid);
      await saveUserData(user: userEntity);
    }
  }

  @override
  Future addUserData({required UserEntity user, required String docId}) {
    return firestoeServices.addData(
      path: BackendEndpoints.users,
      data: user.toMap(),
      docId: docId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String docId}) async {
    var user = await firestoeServices.getData(
      path: BackendEndpoints.users,
      docId: docId,
    );
    return UserEntity.fromMap(user);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(user.toMap());
    await Prefs.setString('userData', jsonData);
  }
}
