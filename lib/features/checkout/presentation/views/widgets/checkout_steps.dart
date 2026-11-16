import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key, required this.titles, required this.current, this.onTap});
  final List<String> titles;
  final int current;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(titles.length, (i) {
        final done = i < current;
        final active = i == current;
        return GestureDetector(
          onTap: () => onTap?.call(i),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done || active
                      ? AppColors.green1500
                      : const Color(0xffF2F3F3),
                ),
                child: Center(
                  child: done
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : Text('${i + 1}',
                          style: AppStyles.bodyXSmallBold.copyWith(
                              color: active
                                  ? Colors.white
                                  : AppColors.grayscale950)),
                ),
              ),
              const SizedBox(width: 6),
              Text(titles[i],
                  style: AppStyles.bodySmallBold.copyWith(
                      color: done || active
                          ? AppColors.green1500
                          : AppColors.grayscale400)),
            ],
          ),
        );
      }),
    );
  }
}
