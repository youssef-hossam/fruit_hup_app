import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/home/presentation/home_tabs.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.label,
    required this.title,
    required this.image,
    required this.color,
    this.onTap,
  });

  final String label;
  final String title;
  final ImageProvider image;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: image, fit: BoxFit.cover),
          // Coloured panel with a curved edge on the text side.
          FractionallySizedBox(
            alignment: AlignmentDirectional.centerStart,
            widthFactor: 0.55,
            child: ClipPath(
              clipper: _CurveClipper(Directionality.of(context)),
              child: Container(
                color: color,
                padding: EdgeInsetsDirectional.only(start: 20.w, end: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bodySmallRegular
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 4.h),
                    Text(title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bodyLargeBold
                            .copyWith(color: Colors.white)),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: onTap ?? () => HomeTabs.go(HomeTabs.products),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          S.of(context).shoppingNow,
                          style:
                              AppStyles.bodySmallBold.copyWith(color: color),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurveClipper extends CustomClipper<Path> {
  _CurveClipper(this.direction);
  final TextDirection direction;

  @override
  Path getClip(Size size) {
    final rtl = direction == TextDirection.rtl;
    final path = Path();
    if (rtl) {
      // panel sits on the right, curve on its left edge
      path.moveTo(size.width, 0);
      path.lineTo(18, 0);
      path.quadraticBezierTo(-10, size.height / 2, 18, size.height);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width - 18, 0);
      path.quadraticBezierTo(
          size.width + 10, size.height / 2, size.width - 18, size.height);
      path.lineTo(0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _CurveClipper old) => old.direction != direction;
}
