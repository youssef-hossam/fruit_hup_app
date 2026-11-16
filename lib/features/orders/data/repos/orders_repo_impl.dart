import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/demo/demo_data_seeder.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_app/features/orders/data/models/order_model.dart';
import 'package:fruit_hub_app/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_hub_app/features/orders/domain/repos/orders_repo.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;
  final DemoDataSeeder seeder;

  OrdersRepoImpl({required this.databaseService, required this.seeder});

  @override
  Future<Either<Failure, void>> addOrder(OrderEntity order) async {
    try {
      await databaseService.addData(
        path: BackEndEndpoints.orders,
        documentId: order.id,
        data: OrderModel.toJson(order),
      );
      return right(null);
    } catch (e) {
      log('OrdersRepoImpl.addOrder: $e');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getUserOrders(String uid) async {
    try {
      await seeder.seedOrdersIfEmpty(uid);
      final data = await databaseService.getCollection(
        path: BackEndEndpoints.orders,
        whereField: 'uid',
        isEqualTo: uid,
        orderBy: 'createdAt',
        descending: true,
      );
      return right(data.map(OrderModel.fromJson).toList());
    } catch (e) {
      log('OrdersRepoImpl.getUserOrders: $e');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }
}
