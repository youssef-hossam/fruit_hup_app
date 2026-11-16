import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/entities/review_entity.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/helper_function/is_arabic.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_network_image.dart';
import 'package:fruit_hub_app/core/widgets/product_item.dart';
import 'package:fruit_hub_app/core/widgets/quantity_button.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ProductDetailsView extends StatefulWidget {
  static const routeName = '/product-details';
  const ProductDetailsView({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final s = S.of(context);
    final ar = isArabic(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _Header(product: p)),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList.list(children: [
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p.localizedName(ar),
                            style: AppStyles.bodyBaseBold
                                .copyWith(color: AppColors.grayscale950)),
                        const SizedBox(height: 4),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: '${formatPrice(p.price)} ${s.currency}',
                            style: AppStyles.bodyBaseBold
                                .copyWith(color: AppColors.orange500),
                          ),
                          TextSpan(
                            text: ' / ${p.localizedUnit(ar)}',
                            style: AppStyles.bodyBaseBold
                                .copyWith(color: AppColors.orange300),
                          ),
                        ])),
                        if (p.hasDiscount)
                          Text(
                            '${formatPrice(p.oldPrice!)} ${s.currency}',
                            style: AppStyles.bodySmallRegular.copyWith(
                              color: AppColors.grayscale400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                  ),
                  QuantityStepper(
                    quantity: _quantity,
                    onIncrement: () => setState(() => _quantity++),
                    onDecrement: () {
                      if (_quantity > 1) setState(() => _quantity--);
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  const Icon(Icons.star_rounded,
                      color: AppColors.orange500, size: 20),
                  const SizedBox(width: 4),
                  Text('${p.avgRating}',
                      style: AppStyles.bodySmallsemiBold
                          .copyWith(color: AppColors.grayscale950)),
                  const SizedBox(width: 6),
                  Text('(${p.ratingCount}+)',
                      style: AppStyles.bodySmallRegular
                          .copyWith(color: AppColors.grayscale400)),
                  const SizedBox(width: 10),
                  Text(s.reviews,
                      style: AppStyles.bodySmallBold.copyWith(
                        color: AppColors.green1500,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                p.localizedDescription(ar),
                style: AppStyles.bodySmallRegular
                    .copyWith(color: AppColors.grayscale400),
              ),
              SizedBox(height: 16.h),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 163 / 80,
                children: [
                  _InfoCard(
                    icon: Icons.calendar_month_outlined,
                    title: s.monthsCount(p.expirationMonths),
                    subtitle: s.expiry,
                  ),
                  _InfoCard(
                    icon: Icons.eco_outlined,
                    title: p.isOrganic ? '100%' : s.notOrganic,
                    subtitle: s.organic,
                  ),
                  _InfoCard(
                    icon: Icons.local_fire_department_outlined,
                    title: s.caloriesValue(p.numberOfCalories),
                    subtitle: s.per100g,
                  ),
                  _InfoCard(
                    icon: Icons.star_border_rounded,
                    title: '${p.avgRating} (${p.ratingCount})',
                    subtitle: s.reviews,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              if (p.reviews.isNotEmpty) ...[
                Text(s.reviewsCount(p.ratingCount),
                    style: AppStyles.bodyBaseBold
                        .copyWith(color: AppColors.grayscale950)),
                SizedBox(height: 8.h),
                ...p.reviews.map((r) => _ReviewTile(review: r)),
              ],
              SizedBox(height: 100.h),
            ]),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
        child: SafeArea(
          top: false,
          child: CustomButton(
            text:
                '${s.addToCart}  •  ${formatPrice(p.price * _quantity)} ${s.currency}',
            onPress: () {
              context.read<CartCubit>().addProduct(p, quantity: _quantity);
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(s.addedToCart),
                  backgroundColor: AppColors.green1500,
                ));
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return SizedBox(
      height: 320.h + topPadding,
      child: Stack(
        children: [
          // Light green blob behind the product, like the Figma design.
          Positioned.fill(
            bottom: 30.h,
            child: ClipPath(
              clipper: _BottomCurveClipper(),
              child: Container(color: const Color(0xffF3F5F7)),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.55),
            child: Hero(
              tag: 'product-${product.id}',
              child: ClipOval(
                child: CustomNetworkImage(
                  url: product.imageUrl,
                  width: 210.w,
                  height: 210.w,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: topPadding + 8,
            start: 16,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(30),
              child: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back_ios_new,
                    size: 16, color: AppColors.grayscale950),
              ),
            ),
          ),
          PositionedDirectional(
            top: topPadding + 4,
            end: 8,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: FavoriteButton(productId: product.id, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 60)
      ..quadraticBezierTo(
          size.width / 2, size.height + 40, size.width, size.height - 60)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _InfoCard extends StatelessWidget {
  const _InfoCard(
      {required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffF1F1F5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bodyBaseBold
                        .copyWith(color: AppColors.green1500)),
                Text(subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bodySmallsemiBold
                        .copyWith(color: AppColors.grayscale400)),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: AppColors.green150, shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.green1500, size: 22),
          ),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review});
  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.green1100,
            child: Text(review.name.characters.first,
                style:
                    AppStyles.bodyBaseBold.copyWith(color: AppColors.green1500)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(review.name,
                          style: AppStyles.bodySmallBold
                              .copyWith(color: AppColors.grayscale950)),
                    ),
                    ...List.generate(
                      5,
                      (i) => Icon(
                        i < review.rating
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        size: 14,
                        color: AppColors.orange500,
                      ),
                    ),
                  ],
                ),
                Text(review.date,
                    style: AppStyles.bodyXSmallRegular
                        .copyWith(color: AppColors.grayscale400)),
                const SizedBox(height: 4),
                Text(review.reviewDescription,
                    style: AppStyles.bodySmallRegular
                        .copyWith(color: AppColors.grayscale600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
