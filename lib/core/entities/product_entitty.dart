import 'dart:io';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final double price;
  final int quantity;
  final bool isFeatured;
  final bool isOrganic;
  final int expirationMonths;
  final int numberOfCalories;
  final File image;
  String imageUrl;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.quantity,
    required this.isFeatured,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.image,
    this.imageUrl = '',
  });
}
