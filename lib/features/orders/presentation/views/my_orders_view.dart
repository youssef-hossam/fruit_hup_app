import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/helper_function/get_saved_user.data.dart';
import 'package:fruit_hub_app/core/helper_function/is_arabic.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/custom_network_image.dart';
import 'package:fruit_hub_app/core/widgets/empty_state.dart';
import 'package:fruit_hub_app/core/widgets/error_view.dart';
import 'package:fruit_hub_app/core/widgets/fruit_app_bar.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/domain/repos/orders_repo.dart';
import 'package:fruit_hub_app/features/orders/presentation/cubits/orders_cubit/orders_cubit.dart';
import 'package:fruit_hub_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class MyOrdersView extends StatelessWidget {
  static const routeName = '/my-orders';
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = getSavedUserData().uid;
    return BlocProvider(
      create: (_) => OrdersCubit(getIt<OrdersRepo>())..getOrders(uid),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildFruitAppBar(context,
            title: S.of(context).myOrders, showNotification: true),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) => switch (state) {
            OrdersSuccess(orders: final orders) when orders.isEmpty =>
              EmptyState(
                icon: Icons.receipt_long_outlined,
                title: S.of(context).noOrders,
              ),
            OrdersSuccess(orders: final orders) => ListView.separated(
                padding: EdgeInsets.all(16.w),
                itemCount: orders.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (_, i) => _OrderCard(order: orders[i]),
              ),
            OrdersFailure(message: final m) => ErrorView(
                message: m,
                onRetry: () => context.read<OrdersCubit>().getOrders(uid),
              ),
            _ => const Center(
                child: CircularProgressIndicator(color: AppColors.green1500)),
          },
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final ar = isArabic(context);
    final date = DateFormat('d MMM yyyy • h:mm a', ar ? 'ar' : 'en')
        .format(order.createdAt);
    final (label, color) = switch (order.status) {
      OrderStatus.pending => (s.statusPending, AppColors.orange500),
      OrderStatus.preparing => (s.statusPreparing, AppColors.orange500),
      OrderStatus.onTheWay => (s.statusOnTheWay, const Color(0xff2D9F5D)),
      OrderStatus.delivered => (s.statusDelivered, AppColors.green1500),
      OrderStatus.cancelled => (s.statusCancelled, const Color(0xffE45556)),
    };

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF7F8F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4),
          childrenPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12),
          leading: Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
                color: AppColors.green150, shape: BoxShape.circle),
            child: const Icon(Icons.inventory_2_outlined,
                color: AppColors.green1500),
          ),
          title: Text(s.orderNumber(order.id),
              style: AppStyles.bodySmallBold
                  .copyWith(color: AppColors.grayscale950)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date,
                  style: AppStyles.bodyXSmallRegular
                      .copyWith(color: AppColors.grayscale400)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                      '${s.itemsCountShort(order.itemsCount)} • ${formatPrice(order.total)} ${s.currency}',
                      style: AppStyles.bodyXSmallSemiBold
                          .copyWith(color: AppColors.grayscale600)),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(label,
                        style:
                            AppStyles.bodyXSmallBold.copyWith(color: color)),
                  ),
                ],
              ),
            ],
          ),
          children: [
            _StatusTimeline(status: order.status),
            const SizedBox(height: 8),
            ...order.items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      ClipOval(
                        child: CustomNetworkImage(
                            url: item.imageUrl, width: 34, height: 34),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '${ar ? item.name : item.nameEn}  ×${item.quantity}',
                          style: AppStyles.bodySmallsemiBold
                              .copyWith(color: AppColors.grayscale800),
                        ),
                      ),
                      Text(
                          '${formatPrice(item.price * item.quantity)} ${s.currency}',
                          style: AppStyles.bodySmallBold
                              .copyWith(color: AppColors.orange500)),
                    ],
                  ),
                )),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 18, color: AppColors.grayscale400),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(order.address.toString(),
                      style: AppStyles.bodyXSmallRegular
                          .copyWith(color: AppColors.grayscale600)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusTimeline extends StatelessWidget {
  const _StatusTimeline({required this.status});
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final steps = [
      s.statusPending,
      s.statusPreparing,
      s.statusOnTheWay,
      s.statusDelivered
    ];
    final reached = status == OrderStatus.cancelled ? -1 : status.index;
    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          final done = (i ~/ 2) < reached;
          return Expanded(
            child: Container(
              height: 2,
              color: done ? AppColors.green1500 : AppColors.grayscale200,
            ),
          );
        }
        final index = i ~/ 2;
        final done = index <= reached;
        return Column(
          children: [
            CircleAvatar(
              radius: 9,
              backgroundColor:
                  done ? AppColors.green1500 : AppColors.grayscale200,
              child: done
                  ? const Icon(Icons.check, size: 11, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 4),
            Text(steps[index],
                style: AppStyles.bodyXSmallRegular.copyWith(
                    fontSize: 9,
                    color:
                        done ? AppColors.green1500 : AppColors.grayscale400)),
          ],
        );
      }),
    );
  }
}
