import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/helper_function/is_arabic.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_network_image.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final ar = isArabic(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ProductDetailsView.routeName,
          arguments: product),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF3F5F7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 26, 22, 6),
                    child: Hero(
                      tag: 'product-${product.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: CustomNetworkImage(url: product.imageUrl),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.localizedName(ar),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.bodySmallsemiBold
                                  .copyWith(color: AppColors.grayscale950),
                            ),
                            const SizedBox(height: 2),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text:
                                      '${formatPrice(product.price)} ${S.of(context).currency}',
                                  style: AppStyles.bodySmallBold
                                      .copyWith(color: AppColors.orange500),
                                ),
                                TextSpan(
                                  text: ' / ${product.localizedUnit(ar)}',
                                  style: AppStyles.bodySmallsemiBold
                                      .copyWith(color: AppColors.orange300),
                                ),
                              ]),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          context.read<CartCubit>().addProduct(product);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(S.of(context).addedToCart),
                              backgroundColor: AppColors.green1500,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(milliseconds: 1200),
                            ));
                        },
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.green1500,
                          child:
                              Icon(Icons.add, color: Colors.white, size: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (product.hasDiscount)
              PositionedDirectional(
                top: 8,
                start: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.orange500,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    S.of(context).percentOff(product.discountPercent),
                    style: AppStyles.bodyXSmallBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: FavoriteButton(productId: product.id),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.productId, this.size = 22});
  final String productId;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isFav = context.select<FavoritesCubit, bool>(
        (cubit) => cubit.state.contains(productId));
    return IconButton(
      onPressed: () => context.read<FavoritesCubit>().toggle(productId),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, a) => ScaleTransition(scale: a, child: child),
        child: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          key: ValueKey(isFav),
          size: size,
          color: isFav ? const Color(0xffE45556) : AppColors.grayscale400,
        ),
      ),
    );
  }
}
