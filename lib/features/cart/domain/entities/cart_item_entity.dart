import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/models/product_model.dart';

class CartItemEntity {
  final ProductEntity product;
  final int quantity;

  const CartItemEntity({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;

  CartItemEntity copyWith({int? quantity}) =>
      CartItemEntity(product: product, quantity: quantity ?? this.quantity);

  Map<String, dynamic> toJson() => {
        'product': ProductModel.fromEntity(product).toJson(),
        'quantity': quantity,
      };

  factory CartItemEntity.fromJson(Map<String, dynamic> json) => CartItemEntity(
        product:
            ProductModel.fromJson(Map<String, dynamic>.from(json['product'])),
        quantity: json['quantity'] as int,
      );
}
