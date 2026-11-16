import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/search/presentation/views/search_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

/// Looks like a search field; opens the search screen when tapped.
class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SearchView.routeName),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 9,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Image(
                image: Svg(Assets.imagesSearchIcon), width: 20, height: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                S.of(context).searchHint,
                style: AppStyles.bodySmallRegular
                    .copyWith(color: AppColors.grayscale400),
              ),
            ),
            const Image(
                image: Svg(Assets.imagesFilterIcon), width: 20, height: 20),
          ],
        ),
      ),
    );
  }
}
