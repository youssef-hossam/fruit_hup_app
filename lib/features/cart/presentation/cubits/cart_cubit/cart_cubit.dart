import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/services/shared_prefrences_singleton.dart';
import 'package:fruit_hub_app/features/cart/domain/entities/cart_item_entity.dart';

/// Holds the cart for the whole app and keeps it saved on the device,
/// so it survives app restarts.
class CartCubit extends Cubit<List<CartItemEntity>> {
  CartCubit() : super(const []) {
    _load();
  }

  static const _key = 'cart_items';

  int get itemsCount => state.length;

  double get subtotal => state.fold(0, (sum, item) => sum + item.totalPrice);

  int quantityOf(String productId) => state
      .where((e) => e.product.id == productId)
      .fold(0, (sum, e) => sum + e.quantity);

  void addProduct(ProductEntity product, {int quantity = 1}) {
    final index = state.indexWhere((e) => e.product.id == product.id);
    if (index == -1) {
      _update([...state, CartItemEntity(product: product, quantity: quantity)]);
    } else {
      final items = [...state];
      items[index] =
          items[index].copyWith(quantity: items[index].quantity + quantity);
      _update(items);
    }
  }

  void increment(String productId) => _changeQuantity(productId, 1);

  void decrement(String productId) => _changeQuantity(productId, -1);

  void remove(String productId) =>
      _update(state.where((e) => e.product.id != productId).toList());

  void clear() => _update(const []);

  void _changeQuantity(String productId, int delta) {
    final items = <CartItemEntity>[];
    for (final item in state) {
      if (item.product.id != productId) {
        items.add(item);
      } else if (item.quantity + delta > 0) {
        items.add(item.copyWith(quantity: item.quantity + delta));
      }
    }
    _update(items);
  }

  void _update(List<CartItemEntity> items) {
    emit(items);
    Pref.setString(_key, jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  void _load() {
    final saved = Pref.getString(_key);
    if (saved == null) return;
    try {
      final list = (jsonDecode(saved) as List)
          .map((e) => CartItemEntity.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      emit(list);
    } catch (_) {
      Pref.remove(_key);
    }
  }
}
