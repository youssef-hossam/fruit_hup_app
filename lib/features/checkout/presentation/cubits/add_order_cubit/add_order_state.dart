part of 'add_order_cubit.dart';

sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderSuccess extends AddOrderState {
  final OrderEntity order;
  AddOrderSuccess(this.order);
}

final class AddOrderFailure extends AddOrderState {
  final String message;
  AddOrderFailure(this.message);
}
