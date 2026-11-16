import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/widgets/product_item.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 163 / 214,
        ),
        itemBuilder: (context, index) => ProductItem(product: products[index]),
      ),
    );
  }
}

/// Grey placeholder cards shown while products load.
class ProductsSliverGridLoading extends StatelessWidget {
  const ProductsSliverGridLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 163 / 214,
        ),
        itemBuilder: (_, __) => const _LoadingCard(),
      ),
    );
  }
}

class _LoadingCard extends StatefulWidget {
  const _LoadingCard();
  @override
  State<_LoadingCard> createState() => _LoadingCardState();
}

class _LoadingCardState extends State<_LoadingCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 900))
    ..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.45, end: 1.0).animate(_c),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffEDEFF1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
