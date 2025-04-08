import 'package:flutter/material.dart';
import 'package:fruit_hub/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(),
    );
  }
}
