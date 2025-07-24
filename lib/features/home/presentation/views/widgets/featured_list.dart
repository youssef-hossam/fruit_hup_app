import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            3,
            (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const FeaturedItem(),
                )),
      ),
    );
  }
}
