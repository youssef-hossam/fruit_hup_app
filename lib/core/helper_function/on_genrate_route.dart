import 'package:flutter/material.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/register_view.dart';
import 'package:fruit_hub_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
