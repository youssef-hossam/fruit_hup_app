import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:fruit_hub_app/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:fruit_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub_app/core/demo/app_config.dart';
import 'package:fruit_hub_app/core/demo/demo_database_service.dart';
import 'package:fruit_hub_app/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_app/core/services/custom_obsrver.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/helper_function/on_genrate_route.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kDemoMode) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  Bloc.observer = CustomBlocObserver();
  setupLocator();
  await Pref.init();
  await initializeDateFormatting();
  if (kDemoMode) {
    await Pref.setString(BackEndEndpoints.savedUserData,
        jsonEncode(DemoDatabaseService.demoUser.toJson()));
  }
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(create: (_) => ProductsCubit(getIt<ProductsRepo>())),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => FavoritesCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) => MaterialApp(
            title: 'FruitHub',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.green1500,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateRoute: onGenerateRoute,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashView.routeName,
          ),
        ),
      ),
    );
  }
}
