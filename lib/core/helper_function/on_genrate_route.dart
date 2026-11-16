import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/register_view.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/order_success_view.dart';
import 'package:fruit_hub_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:fruit_hub_app/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub_app/features/notifications/presentation/views/notifications_view.dart';
import 'package:fruit_hub_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/presentation/views/my_orders_view.dart';
import 'package:fruit_hub_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:fruit_hub_app/features/search/presentation/views/search_view.dart';
import 'package:fruit_hub_app/features/splash/presentation/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  Widget page;
  switch (settings.name) {
    case SplashView.routeName:
      page = const SplashView();
    case LoginView.routeName:
      page = const LoginView();
    case OnBoardingView.routeName:
      page = const OnBoardingView();
    case RegisterView.routeName:
      page = const RegisterView();
    case HomeView.routeName:
      page = const HomeView();
    case ProductDetailsView.routeName:
      page = ProductDetailsView(product: settings.arguments as ProductEntity);
    case SearchView.routeName:
      page = const SearchView();
    case CheckoutView.routeName:
      page = const CheckoutView();
    case OrderSuccessView.routeName:
      page = OrderSuccessView(order: settings.arguments as OrderEntity);
    case MyOrdersView.routeName:
      page = const MyOrdersView();
    case FavoritesView.routeName:
      page = const FavoritesView();
    case NotificationsView.routeName:
      page = const NotificationsView();
    default:
      page = const Scaffold();
  }
  return MaterialPageRoute(builder: (_) => page, settings: settings);
}
