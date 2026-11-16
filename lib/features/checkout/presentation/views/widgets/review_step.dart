import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ReviewStep extends StatelessWidget {
  const ReviewStep({
    super.key,
    required this.address,
    required this.paymentMethod,
    required this.onEditAddress,
  });

  final ShippingAddressEntity address;
  final String paymentMethod;
  final VoidCallback onEditAddress;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final subtotal = context.watch<CartCubit>().subtotal;
    final fee = deliveryFeeFor(subtotal);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        _Section(
          title: s.orderSummary,
          child: Column(
            children: [
              SummaryRow(
                  label: s.subtotal,
                  value: '${formatPrice(subtotal)} ${s.currency}'),
              SummaryRow(
                  label: s.delivery,
                  value: fee == 0 ? s.free : '${formatPrice(fee)} ${s.currency}'),
              const Divider(color: Color(0xffCACECE), height: 24),
              SummaryRow(
                label: s.total,
                value: '${formatPrice(subtotal + fee)} ${s.currency}',
                bold: true,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _Section(
          title: s.paymentMethod,
          child: Row(
            children: [
              const Icon(Icons.payments_outlined, color: AppColors.green1500),
              const SizedBox(width: 10),
              Text(
                paymentMethod == 'cash' ? s.cashOnDelivery : s.payOnline,
                style: AppStyles.bodySmallsemiBold
                    .copyWith(color: AppColors.grayscale600),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        _Section(
          title: s.deliverTo,
          action: TextButton.icon(
            onPressed: onEditAddress,
            icon: const Icon(Icons.edit_outlined, size: 16),
            label: Text(s.edit),
          ),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  color: AppColors.green1500),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${address.fullName} • ${address.phone}\n$address',
                  style: AppStyles.bodySmallRegular
                      .copyWith(color: AppColors.grayscale600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child, this.action});
  final String title;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0x33D9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(title,
                    style: AppStyles.bodySmallBold
                        .copyWith(color: AppColors.grayscale950)),
              ),
              if (action != null) action!,
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  const SummaryRow(
      {super.key, required this.label, required this.value, this.bold = false});
  final String label;
  final String value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final style = bold
        ? AppStyles.bodyBaseBold.copyWith(color: AppColors.grayscale950)
        : AppStyles.bodySmallRegular.copyWith(color: AppColors.grayscale400);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(label, style: style)),
          Text(value,
              style: bold
                  ? style
                  : AppStyles.bodySmallsemiBold
                      .copyWith(color: AppColors.grayscale950)),
        ],
      ),
    );
  }
}
