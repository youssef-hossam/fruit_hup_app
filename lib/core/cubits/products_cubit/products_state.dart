part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);

  List<ProductEntity> get bestSelling => products.take(8).toList();

  List<ProductEntity> get offers =>
      products.where((p) => p.isFeatured && p.hasDiscount).toList();
}

final class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure(this.message);
}
