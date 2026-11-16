import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/helper_function/is_arabic.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/core/widgets/fruit_app_bar.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class _Notification {
  final IconData icon;
  final Color color;
  final String ar;
  final String en;
  final String timeAr;
  final String timeEn;
  final bool isNew;
  const _Notification(this.icon, this.color, this.ar, this.en, this.timeAr,
      this.timeEn, this.isNew);
}

// Static demo notifications (no push backend in this project yet).
const _notifications = [
  _Notification(Icons.local_offer_outlined, AppColors.orange500,
      'خصم 20% على المانجو العويسي لفترة محدودة 🥭',
      '20% off Owais mango for a limited time 🥭', 'منذ 9 دقائق', '9 min ago', true),
  _Notification(Icons.delivery_dining_outlined, AppColors.green1500,
      'طلبك FH-48213 في الطريق إليك',
      'Your order FH-48213 is on the way', 'منذ ساعة', '1 hour ago', true),
  _Notification(Icons.eco_outlined, Color(0xff2D9F5D),
      'وصل كريز الموسم! اطلبه قبل ما يخلص',
      'Seasonal cherries just arrived! Order before they sell out',
      'منذ 5 ساعات', '5 hours ago', false),
  _Notification(Icons.check_circle_outline, AppColors.green1500,
      'تم توصيل طلبك FH-47106، بالهنا والشفا',
      'Order FH-47106 was delivered. Enjoy!', 'منذ 8 أيام', '8 days ago', false),
  _Notification(Icons.card_giftcard_outlined, AppColors.orange500,
      'توصيل مجاني على كل الطلبات فوق 300 جنيه',
      'Free delivery on all orders over 300 EGP', 'منذ أسبوعين', '2 weeks ago',
      false),
];

class NotificationsView extends StatelessWidget {
  static const routeName = '/notifications';
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ar = isArabic(context);
    final s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildFruitAppBar(context, title: s.notifications),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8, 16.w, 8),
            child: Row(
              children: [
                Text(s.newLabel,
                    style: AppStyles.bodySmallBold
                        .copyWith(color: AppColors.grayscale950)),
                const SizedBox(width: 6),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.green150,
                  child: Text(
                      '${_notifications.where((n) => n.isNew).length}',
                      style: AppStyles.bodyXSmallBold
                          .copyWith(color: AppColors.green1500)),
                ),
                const Spacer(),
                Text(s.markAllRead,
                    style: AppStyles.bodySmallRegular
                        .copyWith(color: AppColors.grayscale400)),
              ],
            ),
          ),
          ..._notifications.map((n) => Container(
                color: n.isNew ? AppColors.green150 : Colors.white,
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: n.color.withOpacity(0.12),
                      child: Icon(n.icon, color: n.color),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(ar ? n.ar : n.en,
                          style: AppStyles.bodySmallsemiBold
                              .copyWith(color: AppColors.grayscale950)),
                    ),
                    const SizedBox(width: 8),
                    Text(ar ? n.timeAr : n.timeEn,
                        style: AppStyles.bodyXSmallRegular
                            .copyWith(color: AppColors.grayscale400)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
