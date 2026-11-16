import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub_app/features/home/presentation/home_tabs.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/bottom_nav_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.selected, required this.onTap});
  final int selected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final cartCount = context.select<CartCubit, int>((c) => c.state.length);
    final items = bottomNavigationItems(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 25,
            offset: const Offset(0, -2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (i) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(i),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      BottomNavItem(item: items[i], isSelected: i == selected),
                      if (i == HomeTabs.cart && cartCount > 0)
                        PositionedDirectional(
                          top: 10,
                          end: -6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            constraints: const BoxConstraints(minWidth: 18),
                            decoration: const BoxDecoration(
                              color: AppColors.orange500,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '$cartCount',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
