import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/bottom_nav_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar(
      {super.key, required this.controller, required this.selected});
  final PageController controller;
  int selected;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          )),
      height: 60.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bottomNavigationItems
                .asMap()
                .entries
                .map((e) => GestureDetector(
                      onTap: () {
                        print('Selected: ${e.key}');
                        widget.controller.jumpToPage(e.key);
                        setState(() {
                          widget.selected = e.key;
                        });
                      },
                      child: BottomNavItem(
                          item: e.value, isSelected: e.key == widget.selected),
                    ))
                .toList()),
      ),
    );
  }
}
