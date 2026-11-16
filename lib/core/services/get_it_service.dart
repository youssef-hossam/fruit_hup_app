import 'package:fruit_hub_app/core/demo/app_config.dart';
import 'package:fruit_hub_app/core/demo/demo_data_seeder.dart';
import 'package:fruit_hub_app/core/demo/demo_database_service.dart';
import 'package:fruit_hub_app/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_app/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/core/services/firstore_service.dart';
import 'package:fruit_hub_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub_app/features/orders/data/repos/orders_repo_impl.dart';
import 'package:fruit_hub_app/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(
      kDemoMode ? DemoDatabaseService() : FirestoreService());
  getIt.registerSingleton<DemoDataSeeder>(
      DemoDataSeeder(getIt<DatabaseService>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
        firebaseAuth: getIt<FirebaseAuthService>(),
        databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
      databaseService: getIt<DatabaseService>(),
      seeder: getIt<DemoDataSeeder>()));
  getIt.registerSingleton<OrdersRepo>(OrdersRepoImpl(
      databaseService: getIt<DatabaseService>(),
      seeder: getIt<DemoDataSeeder>()));
}
