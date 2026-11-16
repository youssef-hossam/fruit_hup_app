import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub_app/features/cart/presentation/views/cart_view.dart';
import 'package:fruit_hub_app/features/home/presentation/home_tabs.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit_hub_app/features/products/presentation/views/products_view.dart';
import 'package:fruit_hub_app/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    HomeTabs.current.value = HomeTabs.home;
    final cubit = context.read<ProductsCubit>();
    if (cubit.state is! ProductsSuccess) cubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: HomeTabs.current,
      builder: (context, selected, _) => PopScope(
        canPop: selected == HomeTabs.home,
        onPopInvoked: (didPop) {
          if (!didPop) HomeTabs.go(HomeTabs.home);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(
              index: selected,
              children: const [
                HomeViewBody(),
                ProductsView(),
                CartView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            selected: selected,
            onTap: HomeTabs.go,
          ),
        ),
      ),
    );
  }
}
