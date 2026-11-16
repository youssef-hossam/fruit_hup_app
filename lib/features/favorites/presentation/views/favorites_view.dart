import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:fruit_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub_app/core/widgets/empty_state.dart';
import 'package:fruit_hub_app/core/widgets/fruit_app_bar.dart';
import 'package:fruit_hub_app/core/widgets/products_sliver_grid.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class FavoritesView extends StatelessWidget {
  static const routeName = '/favorites';
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final ids = context.watch<FavoritesCubit>().state;
    final products = context
        .watch<ProductsCubit>()
        .products
        .where((p) => ids.contains(p.id))
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildFruitAppBar(context, title: S.of(context).favorites),
      body: products.isEmpty
          ? EmptyState(
              icon: Icons.favorite_border,
              title: S.of(context).noFavorites,
            )
          : CustomScrollView(slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              ProductsSliverGrid(products: products),
            ]),
    );
  }
}
