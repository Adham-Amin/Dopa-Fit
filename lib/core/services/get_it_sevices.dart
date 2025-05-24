import 'package:dopa_fit/core/services/firebase_auth_servies.dart';
import 'package:dopa_fit/core/services/firestoe_services.dart';
import 'package:dopa_fit/features/auth/data/repos/auth_repo_impl.dart';
import 'package:dopa_fit/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServies>(FirebaseAuthServies());
  getIt.registerSingleton<FirestoeServices>(FirestoeServices());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseServies: getIt<FirebaseAuthServies>(),
      firestoeServices: getIt<FirestoeServices>(),
    ),
  );
}
