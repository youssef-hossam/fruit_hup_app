import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/error_view.dart';
import 'package:fruit_hub_app/core/widgets/notification_button.dart';
import 'package:fruit_hub_app/core/widgets/products_sliver_grid.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_search_text_field.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

enum ProductsSort { popular, priceLow, priceHigh, rating }

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String _category = 'all';
  ProductsSort _sort = ProductsSort.popular;

  List<ProductEntity> _apply(List<ProductEntity> all) {
    final list = _category == 'all'
        ? [...all]
        : all.where((p) => p.category == _category).toList();
    switch (_sort) {
      case ProductsSort.popular:
        list.sort((a, b) => b.sellingCount.compareTo(a.sellingCount));
      case ProductsSort.priceLow:
        list.sort((a, b) => a.price.compareTo(b.price));
      case ProductsSort.priceHigh:
        list.sort((a, b) => b.price.compareTo(a.price));
      case ProductsSort.rating:
        list.sort((a, b) => b.avgRating.compareTo(a.avgRating));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final categories = {
      'all': s.categoryAll,
      'fruits': s.categoryFruits,
      'citrus': s.categoryCitrus,
      'tropical': s.categoryTropical,
      'berries': s.categoryBerries,
    };
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final products =
            state is ProductsSuccess ? _apply(state.products) : <ProductEntity>[];
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        const SizedBox(width: 44),
                        Expanded(
                          child: Text(s.products,
                              textAlign: TextAlign.center,
                              style: AppStyles.bodyLargeBold
                                  .copyWith(color: AppColors.grayscale950)),
                        ),
                        const NotificationButton(),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    const HomeSearchTextField(),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            state is ProductsSuccess
                                ? s.resultsCount(products.length)
                                : s.allProducts,
                            style: AppStyles.bodyBaseBold
                                .copyWith(color: AppColors.grayscale950),
                          ),
                        ),
                        _SortButton(
                          value: _sort,
                          onChanged: (v) => setState(() => _sort = v),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 36,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: categories.entries.map((e) {
                          final selected = e.key == _category;
                          return Padding(
                            padding: const EdgeInsetsDirectional.only(end: 8),
                            child: ChoiceChip(
                              label: Text(e.value),
                              selected: selected,
                              showCheckmark: false,
                              onSelected: (_) =>
                                  setState(() => _category = e.key),
                              labelStyle: AppStyles.bodySmallBold.copyWith(
                                  color: selected
                                      ? Colors.white
                                      : AppColors.grayscale600),
                              selectedColor: AppColors.green1500,
                              backgroundColor: const Color(0xffF3F5F7),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
            switch (state) {
              ProductsSuccess() => ProductsSliverGrid(products: products),
              ProductsFailure() => SliverToBoxAdapter(
                  child: ErrorView(
                    message: state.message,
                    onRetry: () => context.read<ProductsCubit>().getProducts(),
                  ),
                ),
              _ => const ProductsSliverGridLoading(),
            },
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          ],
        );
      },
    );
  }
}

class _SortButton extends StatelessWidget {
  const _SortButton({required this.value, required this.onChanged});
  final ProductsSort value;
  final ValueChanged<ProductsSort> onChanged;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final labels = {
      ProductsSort.popular: s.mostSelled,
      ProductsSort.priceLow: s.sortPriceLow,
      ProductsSort.priceHigh: s.sortPriceHigh,
      ProductsSort.rating: s.sortRating,
    };
    return PopupMenuButton<ProductsSort>(
      initialValue: value,
      onSelected: onChanged,
      color: Colors.white,
      itemBuilder: (_) => labels.entries
          .map((e) => PopupMenuItem(
                value: e.key,
                child: Text(e.value, style: AppStyles.bodySmallsemiBold),
              ))
          .toList(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x66CACECE)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.swap_vert, size: 18, color: AppColors.grayscale950),
            const SizedBox(width: 4),
            Text(labels[value]!,
                style: AppStyles.bodyXSmallSemiBold
                    .copyWith(color: AppColors.grayscale950)),
          ],
        ),
      ),
    );
  }
}
