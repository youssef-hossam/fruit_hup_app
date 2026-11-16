import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/helper_function/format_price.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ShippingStep extends StatelessWidget {
  const ShippingStep({
    super.key,
    required this.selected,
    required this.total,
    required this.onChanged,
  });

  final String selected;
  final double total;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        _OptionTile(
          title: s.cashOnDelivery,
          subtitle: s.cashOnDeliveryDesc,
          trailing: '${formatPrice(total)} ${s.currency}',
          selected: selected == 'cash',
          onTap: () => onChanged('cash'),
        ),
        SizedBox(height: 12.h),
        _OptionTile(
          title: s.payOnline,
          subtitle: s.payOnlineDesc,
          trailing: s.comingSoon,
          selected: false,
          enabled: false,
          onTap: () {},
        ),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.selected,
    required this.onTap,
    this.enabled = true,
  });

  final String title;
  final String subtitle;
  final String trailing;
  final bool selected;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(4),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: const Color(0x33D9D9D9),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: selected ? AppColors.green1500 : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        selected ? AppColors.green1500 : AppColors.grayscale400,
                    width: selected ? 5 : 1,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: AppStyles.bodySmallsemiBold
                            .copyWith(color: AppColors.grayscale950)),
                    Text(subtitle,
                        style: AppStyles.bodySmallRegular
                            .copyWith(color: AppColors.grayscale400)),
                  ],
                ),
              ),
              Text(trailing,
                  style: AppStyles.bodySmallBold
                      .copyWith(color: AppColors.green1500)),
            ],
          ),
        ),
      ),
    );
  }
}
