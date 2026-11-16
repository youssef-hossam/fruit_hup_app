import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/demo/demo_data_seeder.dart';
import 'package:fruit_hub_app/core/entities/product_entity.dart';
import 'package:fruit_hub_app/core/errors/failures.dart';
import 'package:fruit_hub_app/core/models/product_model.dart';
import 'package:fruit_hub_app/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/utils/backend_endpoints.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;
  final DemoDataSeeder seeder;

  ProductsRepoImpl({required this.databaseService, required this.seeder});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      await seeder.seedProductsIfEmpty();
      final data = await databaseService.getCollection(
        path: BackEndEndpoints.products,
        orderBy: 'sellingCount',
        descending: true,
      );
      return right(data.map((e) => ProductModel.fromJson(e)).toList());
    } catch (e) {
      log('ProductsRepoImpl.getProducts: $e');
      return left(ServerFailure(S.current.errorOccurredTryAgain));
    }
  }
}
