import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fruit_hub_app/core/demo/app_config.dart';
import 'package:fruit_hub_app/core/demo/demo_data.dart';
import 'package:fruit_hub_app/core/services/database_service.dart';
import 'package:fruit_hub_app/core/utils/backend_endpoints.dart';

/// Fills an empty Firestore with demo products (and a few past orders for the
/// signed-in user) so a fresh install looks alive. Runs in debug builds only.
class DemoDataSeeder {
  final DatabaseService databaseService;
  DemoDataSeeder(this.databaseService);

  Future<void> seedProductsIfEmpty() async {
    if (!kDebugMode || kDemoMode) return;
    try {
      final empty =
          await databaseService.isCollectionEmpty(path: BackEndEndpoints.products);
      if (!empty) return;
      for (final product in demoProducts) {
        await databaseService.addData(
          path: BackEndEndpoints.products,
          documentId: product['id'] as String,
          data: product,
        );
      }
      log('DemoDataSeeder: added ${demoProducts.length} products');
    } catch (e) {
      log('DemoDataSeeder: could not seed products: $e');
    }
  }

  Future<void> seedOrdersIfEmpty(String uid) async {
    if (!kDebugMode || kDemoMode) return;
    try {
      final orders = await databaseService.getCollection(
        path: BackEndEndpoints.orders,
        whereField: 'uid',
        isEqualTo: uid,
        limit: 1,
      );
      if (orders.isNotEmpty) return;
      for (final order in demoOrdersFor(uid)) {
        await databaseService.addData(
          path: BackEndEndpoints.orders,
          documentId: '${order['id']}-${uid.substring(0, 5)}',
          data: {...order, 'id': '${order['id']}-${uid.substring(0, 5)}'},
        );
      }
    } catch (e) {
      log('DemoDataSeeder: could not seed orders: $e');
    }
  }
}
