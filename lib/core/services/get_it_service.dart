import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/core/services/firstore_service.dart';
import 'package:fruit_hub_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
        firebaseAuth: getIt<FirebaseAuthService>(),
        databaseService: getIt<DatabaseService>()),
  );
}
