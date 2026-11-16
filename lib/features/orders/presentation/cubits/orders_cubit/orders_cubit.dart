import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/domain/repos/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> getOrders(String uid) async {
    emit(OrdersLoading());
    final result = await ordersRepo.getUserOrders(uid);
    result.fold(
      (f) => emit(OrdersFailure(f.message)),
      (orders) => emit(OrdersSuccess(orders)),
    );
  }
}
