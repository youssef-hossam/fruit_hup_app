import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/helper_function/is_arabic.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruit_hub_app/features/product_details/presentation/views/product_details_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class FeaturedList extends StatefulWidget {
  const FeaturedList({super.key, required this.offers});
  final List<ProductEntity> offers;

  @override
  State<FeaturedList> createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  final _controller = PageController(viewportFraction: 0.92);
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final ar = isArabic(context);
    final banners = <Widget>[
      FeaturedItem(
        label: s.eidVoucher,
        title: s.discount,
        image: const AssetImage(Assets.imagesFruitsBanar),
        color: AppColors.green1500,
      ),
      for (final p in widget.offers.take(3))
        FeaturedItem(
          label: p.localizedName(ar),
          title: s.percentOff(p.discountPercent),
          image: NetworkImage(p.imageUrl),
          color: const Color(0xff2D9F5D),
          onTap: () => Navigator.pushNamed(
              context, ProductDetailsView.routeName,
              arguments: p),
        ),
      FeaturedItem(
        label: s.freeDeliveryDesc,
        title: s.freeDeliveryOffer,
        image: const AssetImage(Assets.imagesFruitsBanar),
        color: AppColors.orange500,
      ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 158.h,
          child: PageView.builder(
            controller: _controller,
            padEnds: false,
            itemCount: banners.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w),
              child: banners[i],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: i == _page ? 16 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: i == _page ? AppColors.green1500 : AppColors.green1200,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
