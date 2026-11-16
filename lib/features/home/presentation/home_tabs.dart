import 'package:flutter/foundation.dart';

/// Lets any screen switch the bottom-navigation tab
/// (e.g. "Shop now" in an empty cart, or "Back to home" after checkout).
class HomeTabs {
  static const int home = 0;
  static const int products = 1;
  static const int cart = 2;
  static const int profile = 3;

  static final ValueNotifier<int> current = ValueNotifier<int>(home);

  static void go(int tab) => current.value = tab;
}
