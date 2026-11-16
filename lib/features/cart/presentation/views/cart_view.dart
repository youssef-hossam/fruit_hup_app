import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/helper_function/is_arabic.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/core/widgets/custom_network_image.dart';
import 'package:fruit_hub_app/core/widgets/empty_state.dart';
import 'package:fruit_hub_app/core/widgets/quantity_button.dart';
import 'package:fruit_hub_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_hub_app/features/home/presentation/home_tabs.dart';
import 'package:fruit_hub_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<CartCubit, List<CartItemEntity>>(
      builder: (context, items) {
        final cubit = context.read<CartCubit>();
        return Column(
          children: [
            SizedBox(height: 16.h),
            Text(s.cart,
                style: AppStyles.bodyLargeBold
                    .copyWith(color: AppColors.grayscale950)),
            SizedBox(height: 16.h),
            if (items.isEmpty)
              Expanded(
                child: EmptyState(
                  icon: Icons.shopping_basket_outlined,
                  title: s.cartEmptyTitle,
                  subtitle: s.cartEmptySubtitle,
                  action: SizedBox(
                    width: 200,
                    child: CustomButton(
                      text: s.shoppingNow,
                      onPress: () => HomeTabs.go(HomeTabs.products),
                    ),
                  ),
                ),
              )
            else ...[
              Container(
                width: double.infinity,
                color: AppColors.green150,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  s.cartItemsCount(items.length),
                  textAlign: TextAlign.center,
                  style: AppStyles.bodySmallRegular
                      .copyWith(color: AppColors.green1500),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 1, color: Color(0xffF1F1F5)),
                  itemBuilder: (_, i) => Dismissible(
                    key: ValueKey(items[i].product.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: const Color(0xffFDECEC),
                      alignment: AlignmentDirectional.centerEnd,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete_outline,
                          color: Color(0xffE45556)),
                    ),
                    onDismissed: (_) => cubit.remove(items[i].product.id),
                    child: _CartItemTile(item: items[i]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                child: CustomButton(
                  text: s.checkoutWithTotal(formatPrice(cubit.subtotal)),
                  onPress: () =>
                      Navigator.pushNamed(context, CheckoutView.routeName),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({required this.item});
  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    final ar = isArabic(context);
    final s = S.of(context);
    final cubit = context.read<CartCubit>();
    final p = item.product;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailsView.routeName,
          arguments: p),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 73,
              height: 92,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffF3F5F7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipOval(child: CustomNetworkImage(url: p.imageUrl)),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(p.localizedName(ar),
                            style: AppStyles.bodySmallBold
                                .copyWith(color: AppColors.grayscale950)),
                      ),
                      InkWell(
                        onTap: () => cubit.remove(p.id),
                        child: const Icon(Icons.delete_outline,
                            size: 20, color: AppColors.grayscale400),
                      ),
                    ],
                  ),
                  Text('${item.quantity} ${p.localizedUnit(ar)}',
                      style: AppStyles.bodySmallRegular
                          .copyWith(color: AppColors.orange500)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      QuantityStepper(
                        quantity: item.quantity,
                        size: 26,
                        onIncrement: () => cubit.increment(p.id),
                        onDecrement: () => cubit.decrement(p.id),
                      ),
                      const Spacer(),
                      Text('${formatPrice(item.totalPrice)} ${s.currency}',
                          style: AppStyles.bodyBaseBold
                              .copyWith(color: AppColors.orange500)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
