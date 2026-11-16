import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_button.dart';
import 'package:fruit_hub_app/features/home/presentation/home_tabs.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/presentation/views/my_orders_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class OrderSuccessView extends StatelessWidget {
  static const routeName = '/order-success';
  const OrderSuccessView({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const Spacer(),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 700),
                curve: Curves.elasticOut,
                builder: (_, v, child) =>
                    Transform.scale(scale: v, child: child),
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                      color: AppColors.green150, shape: BoxShape.circle),
                  child: const Center(
                    child: CircleAvatar(
                      radius: 46,
                      backgroundColor: AppColors.green1500,
                      child: Icon(Icons.check_rounded,
                          color: Colors.white, size: 56),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Text(s.orderPlaced,
                  style: AppStyles.heading5Bold
                      .copyWith(color: AppColors.grayscale950)),
              SizedBox(height: 8.h),
              Text(s.orderPlacedDesc,
                  textAlign: TextAlign.center,
                  style: AppStyles.bodySmallRegular
                      .copyWith(color: AppColors.grayscale400)),
              SizedBox(height: 8.h),
              Text(s.orderNumber(order.id),
                  style: AppStyles.bodySmallBold
                      .copyWith(color: AppColors.green1500)),
              const Spacer(),
              CustomButton(
                text: s.trackOrders,
                onPress: () => Navigator.pushReplacementNamed(
                    context, MyOrdersView.routeName),
              ),
              SizedBox(height: 8.h),
              TextButton(
                onPressed: () {
                  HomeTabs.go(HomeTabs.home);
                  Navigator.pop(context);
                },
                child: Text(s.backToHome,
                    style: AppStyles.bodyBaseBold
                        .copyWith(color: AppColors.green1500)),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
