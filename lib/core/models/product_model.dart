import 'dart:io';

import 'package:fruit_hub_app/core/entities/product_entitty.dart';
import 'package:fruit_hub_app/core/entities/review_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final double price;
  final File image;
  final bool isFeatured;
  String imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final double avgRating;
  final int ratingCount;
  final int quantity;
  final int sellingCount;
  final List<ReviewEntity> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.quantity,
    required this.reviews,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.sellingCount = 0,
    this.imageUrl = '',
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      imageUrl: entity.imageUrl,
      isFeatured: entity.isFeatured,
      expirationMonths: entity.expirationMonths,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      quantity: entity.quantity,
      reviews: [],
      avgRating: 0,
      ratingCount: 0,
      sellingCount: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'quantity': quantity,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
