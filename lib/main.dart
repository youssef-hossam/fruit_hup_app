import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper_function/on_genrate_route.dart';
import 'package:fruit_hub/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
    );
  }
}
