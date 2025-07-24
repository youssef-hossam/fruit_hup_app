import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/best_seller_grid_view.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/best_selling_head_line.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_search_text_field.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_view_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          children: [
            SizedBox(height: 16),
            HomeViewAppBar(),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: HomeSearchTextField(),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 158.h,
              child: const FeaturedList(),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: BestSellingHeadline(),
            ),
            SizedBox(height: 8.h),
          ],
        )),
        BestSellerGridView()
      ],
    );
  }
}
