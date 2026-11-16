import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      width: width,
      height: height,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          width: width,
          height: height,
          color: AppColors.grayscale50,
          alignment: Alignment.center,
          child: const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
                strokeWidth: 2, color: AppColors.green1500),
          ),
        );
      },
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: AppColors.grayscale50,
        alignment: Alignment.center,
        child: const Icon(Icons.image_not_supported_outlined,
            color: AppColors.grayscale300),
      ),
    );
  }
}
