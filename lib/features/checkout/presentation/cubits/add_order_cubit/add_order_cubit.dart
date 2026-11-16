import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/domain/repos/orders_repo.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  Future<void> addOrder(OrderEntity order) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(order);
    result.fold(
      (f) => emit(AddOrderFailure(f.message)),
      (_) => emit(AddOrderSuccess(order)),
    );
  }
}
