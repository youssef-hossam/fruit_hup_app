import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/empty_state.dart';
import 'package:fruit_hub_app/core/widgets/fruit_app_bar.dart';
import 'package:fruit_hub_app/core/widgets/products_sliver_grid.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class SearchView extends StatefulWidget {
  static const routeName = '/search';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<ProductEntity> _filter(List<ProductEntity> products) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return const [];
    return products
        .where((p) =>
            p.name.toLowerCase().contains(q) ||
            p.nameEn.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final products = context.watch<ProductsCubit>().products;
    final results = _filter(products);
    final popular = products.take(6).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildFruitAppBar(context,
          title: s.search, showNotification: true),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                controller: _controller,
                autofocus: true,
                onChanged: (v) => setState(() => _query = v),
                style: AppStyles.bodySmallsemiBold,
                decoration: InputDecoration(
                  hintText: s.searchHint,
                  hintStyle: AppStyles.bodySmallRegular
                      .copyWith(color: AppColors.grayscale400),
                  prefixIcon:
                      const Icon(Icons.search, color: AppColors.green1500),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () {
                            _controller.clear();
                            setState(() => _query = '');
                          },
                        ),
                  filled: true,
                  fillColor: const Color(0xffF9FAFA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xffE6E9EA)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Color(0xffE6E9EA)),
                  ),
                ),
              ),
            ),
          ),
          if (_query.trim().isEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(s.popularSearches,
                    style: AppStyles.bodyBaseBold
                        .copyWith(color: AppColors.grayscale950)),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            ProductsSliverGrid(products: popular),
          ] else if (results.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyState(
                icon: Icons.search_off_rounded,
                title: s.noResults,
              ),
            )
          else ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(s.resultsCount(results.length),
                    style: AppStyles.bodyBaseBold
                        .copyWith(color: AppColors.grayscale950)),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            ProductsSliverGrid(products: results),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
