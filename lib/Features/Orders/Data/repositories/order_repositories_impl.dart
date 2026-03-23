import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/Features/Orders/Domain/entity/order_entity.dart';
import 'package:needit_app/Features/Orders/Domain/repositories/order_repositories.dart';
import 'package:needit_app/Features/services/database_service.dart';

class OrderRepositoriesImpl implements OrderRepositories {
  final DataBaseService dataBaseService;
  OrderRepositoriesImpl({required this.dataBaseService});
  @override
  Future<List<OrderEntity>> getOrders({required String userId}) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final querySnapshot =
          await firestore
              .collection('orders')
              .where('userId', isEqualTo: userId) // فلترة حسب الـ User ID
              .orderBy('createdAt', descending: true) // ترتيب من الأحدث للأقدم
              .get();

      return querySnapshot.docs
          .map((doc) => OrderModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      log('Error fetching orders in orderrepositories: $e');
      throw Exception('serverFaliure');
    }
  }
}
