import 'package:fruit_hub_app/core/entities/review_entity.dart';

class ProductEntity {
  final String id;
  final String name;
  final String nameEn;
  final String code;
  final String description;
  final String descriptionEn;
  final double price;
  final double? oldPrice;
  final String unit;
  final String unitEn;
  final String imageUrl;
  final String category;
  final bool isFeatured;
  final bool isOrganic;
  final int expirationMonths;
  final int numberOfCalories;
  final double avgRating;
  final int ratingCount;
  final int sellingCount;
  final List<ReviewEntity> reviews;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.code,
    required this.description,
    required this.descriptionEn,
    required this.price,
    this.oldPrice,
    required this.unit,
    required this.unitEn,
    required this.imageUrl,
    required this.category,
    required this.isFeatured,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.avgRating,
    required this.ratingCount,
    required this.sellingCount,
    required this.reviews,
  });

  bool get hasDiscount => oldPrice != null && oldPrice! > price;

  int get discountPercent =>
      hasDiscount ? (((oldPrice! - price) / oldPrice!) * 100).round() : 0;

  String localizedName(bool isArabic) => isArabic ? name : nameEn;

  String localizedDescription(bool isArabic) =>
      isArabic ? description : descriptionEn;

  String localizedUnit(bool isArabic) => isArabic ? unit : unitEn;
}
