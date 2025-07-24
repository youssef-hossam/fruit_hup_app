import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'ابحث عن.......',
                  hintStyle: AppStyles.bodySmallRegular
                      .copyWith(color: AppColors.grayscale400),
                  border: buildBorder(),
                  prefixIcon: IconButton(
                    icon: Image(
                      image: const Svg(Assets.imagesSearchIcon),
                      width: 23,
                      height: 23,
                    ),
                    onPressed: () {
                      // Add filter functionality here
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Image(
                      image: const Svg(Assets.imagesFilterIcon),
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {
                      // Add filter functionality here
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: buildBorder(),
                  focusedErrorBorder: buildBorder(),
                  errorBorder: buildBorder(),
                  focusedBorder: buildBorder(),
                ))),
        const SizedBox(width: 8.0),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: Colors.white, width: 1.w),
    );
  }
}
