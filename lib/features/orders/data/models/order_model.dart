import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  static OrderEntity fromJson(Map<String, dynamic> json) {
    final address = Map<String, dynamic>.from(json['address'] ?? {});
    return OrderEntity(
      id: json['id'] as String,
      uid: json['uid'] as String,
      items: ((json['items'] as List?) ?? []).map((e) {
        final m = Map<String, dynamic>.from(e);
        return OrderItemEntity(
          productId: m['productId'] as String,
          name: m['name'] as String,
          nameEn: (m['nameEn'] ?? m['name']) as String,
          imageUrl: (m['imageUrl'] ?? '') as String,
          price: (m['price'] as num).toDouble(),
          unit: (m['unit'] ?? 'كيلو') as String,
          unitEn: (m['unitEn'] ?? 'kg') as String,
          quantity: (m['quantity'] as num).toInt(),
        );
      }).toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      paymentMethod: (json['paymentMethod'] ?? 'cash') as String,
      status: OrderStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => OrderStatus.pending,
      ),
      address: ShippingAddressEntity(
        fullName: (address['fullName'] ?? '') as String,
        phone: (address['phone'] ?? '') as String,
        address: (address['address'] ?? '') as String,
        city: (address['city'] ?? '') as String,
        floor: (address['floor'] ?? '') as String,
      ),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  static Map<String, dynamic> toJson(OrderEntity order) => {
        'id': order.id,
        'uid': order.uid,
        'items': order.items
            .map((e) => {
                  'productId': e.productId,
                  'name': e.name,
                  'nameEn': e.nameEn,
                  'imageUrl': e.imageUrl,
                  'price': e.price,
                  'unit': e.unit,
                  'unitEn': e.unitEn,
                  'quantity': e.quantity,
                })
            .toList(),
        'subtotal': order.subtotal,
        'deliveryFee': order.deliveryFee,
        'total': order.total,
        'paymentMethod': order.paymentMethod,
        'status': order.status.name,
        'address': {
          'fullName': order.address.fullName,
          'phone': order.address.phone,
          'address': order.address.address,
          'city': order.address.city,
          'floor': order.address.floor,
        },
        'createdAt': order.createdAt.toIso8601String(),
      };
}
