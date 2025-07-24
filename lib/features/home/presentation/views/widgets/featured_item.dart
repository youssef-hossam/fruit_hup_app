import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Image.asset(Assets.imagesFruitsBanar,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
            AspectRatio(
                aspectRatio: (342 / 158) / 2,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage(
                            Assets.imagesGreenBanar,
                          ),
                          fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).eidVoucher,
                          textAlign: TextAlign.center,
                          style: AppStyles.bodySmallRegular.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S.of(context).discount,
                          style: AppStyles.bodyLargeBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          child: Container(
                            width: 116.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).shoppingNow,
                                style: AppStyles.bodySmallBold.copyWith(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
