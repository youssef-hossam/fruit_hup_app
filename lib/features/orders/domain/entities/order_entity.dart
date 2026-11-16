class OrderItemEntity {
  final String productId;
  final String name;
  final String nameEn;
  final String imageUrl;
  final double price;
  final String unit;
  final String unitEn;
  final int quantity;

  const OrderItemEntity({
    required this.productId,
    required this.name,
    required this.nameEn,
    required this.imageUrl,
    required this.price,
    required this.unit,
    required this.unitEn,
    required this.quantity,
  });
}

class ShippingAddressEntity {
  final String fullName;
  final String phone;
  final String address;
  final String city;
  final String floor;

  const ShippingAddressEntity({
    required this.fullName,
    required this.phone,
    required this.address,
    required this.city,
    required this.floor,
  });

  @override
  String toString() =>
      [address, floor, city].where((e) => e.trim().isNotEmpty).join('، ');
}

enum OrderStatus { pending, preparing, onTheWay, delivered, cancelled }

class OrderEntity {
  final String id;
  final String uid;
  final List<OrderItemEntity> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String paymentMethod;
  final OrderStatus status;
  final ShippingAddressEntity address;
  final DateTime createdAt;

  const OrderEntity({
    required this.id,
    required this.uid,
    required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.paymentMethod,
    required this.status,
    required this.address,
    required this.createdAt,
  });

  int get itemsCount => items.fold(0, (sum, e) => sum + e.quantity);
}
