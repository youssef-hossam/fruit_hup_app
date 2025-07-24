import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xffF3F5F7),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                    onPressed: () {}, icon: Image.asset(Assets.imagesHeart))),
            Column(children: [
              Image.asset(
                Assets.imagesProductTestImage,
              ),
              SizedBox(
                height: 24.h,
              ),
              ListTile(
                title: Text(
                  'تفاح',
                  style: AppStyles.bodySmallsemiBold.copyWith(
                    color: AppColors.grayscale950,
                  ),
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: ' 20جنية',
                        style: AppStyles.bodySmallBold.copyWith(
                          color: AppColors.orange500,
                        ),
                      ),
                      TextSpan(
                        text: ' / كيلو',
                        style: AppStyles.bodySmallBold.copyWith(
                          color: AppColors.orange300,
                        ),
                      )
                    ],
                  ),
                ),
                trailing: CircleAvatar(
                  radius: 22.r,
                  backgroundColor: AppColors.green1500,
                  child: IconButton(
                    icon: Image.asset(Assets.imagesPlusIcon),
                    onPressed: () {},
                  ),
                ),
              ),
            ]),
          ],
        ));
  }
}
