import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/best_selling_head_line.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/fruit_item.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class BestSellerGridView extends StatelessWidget {
  const BestSellerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) => FruitItem(),
    );
  }
}
