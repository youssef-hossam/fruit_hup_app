import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/entities/review_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.nameEn,
    required super.code,
    required super.description,
    required super.descriptionEn,
    required super.price,
    super.oldPrice,
    required super.unit,
    required super.unitEn,
    required super.imageUrl,
    required super.category,
    required super.isFeatured,
    required super.isOrganic,
    required super.expirationMonths,
    required super.numberOfCalories,
    required super.avgRating,
    required super.ratingCount,
    required super.sellingCount,
    required super.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nameEn: (json['nameEn'] ?? json['name']) as String,
      code: (json['code'] ?? '') as String,
      description: (json['description'] ?? '') as String,
      descriptionEn: (json['descriptionEn'] ?? json['description'] ?? '') as String,
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      unit: (json['unit'] ?? 'كيلو') as String,
      unitEn: (json['unitEn'] ?? 'kg') as String,
      imageUrl: (json['imageUrl'] ?? '') as String,
      category: (json['category'] ?? 'fruits') as String,
      isFeatured: (json['isFeatured'] ?? false) as bool,
      isOrganic: (json['isOrganic'] ?? false) as bool,
      expirationMonths: (json['expirationMonths'] as num? ?? 0).toInt(),
      numberOfCalories: (json['numberOfCalories'] as num? ?? 0).toInt(),
      avgRating: (json['avgRating'] as num? ?? 0).toDouble(),
      ratingCount: (json['ratingCount'] as num? ?? 0).toInt(),
      sellingCount: (json['sellingCount'] as num? ?? 0).toInt(),
      reviews: ((json['reviews'] as List?) ?? [])
          .map((e) => ReviewEntity.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  factory ProductModel.fromEntity(ProductEntity e) {
    return ProductModel(
      id: e.id,
      name: e.name,
      nameEn: e.nameEn,
      code: e.code,
      description: e.description,
      descriptionEn: e.descriptionEn,
      price: e.price,
      oldPrice: e.oldPrice,
      unit: e.unit,
      unitEn: e.unitEn,
      imageUrl: e.imageUrl,
      category: e.category,
      isFeatured: e.isFeatured,
      isOrganic: e.isOrganic,
      expirationMonths: e.expirationMonths,
      numberOfCalories: e.numberOfCalories,
      avgRating: e.avgRating,
      ratingCount: e.ratingCount,
      sellingCount: e.sellingCount,
      reviews: e.reviews,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nameEn': nameEn,
      'code': code,
      'description': description,
      'descriptionEn': descriptionEn,
      'price': price,
      if (oldPrice != null) 'oldPrice': oldPrice,
      'unit': unit,
      'unitEn': unitEn,
      'imageUrl': imageUrl,
      'category': category,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
