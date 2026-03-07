import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/core/utlis/backend_endpoints.dart';

abstract class CartRemoteDataSource {
  Future<Unit> checkout({required OrderModel order});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  CartRemoteDataSourceImpl({required this.firestore, required this.auth});

  @override
  Future<Unit> checkout({required OrderModel order}) async {
    final String? currentUserId = auth.currentUser?.uid;
    if (currentUserId == null) {
      throw Exception('User not logged in');
    }

    final ordersCollection = firestore.collection(BackendEndpoints.addOrder);

    // 2. منستخدم الـ orderId اللي ولدناه في الـ Bloc كاسم للـ Document
    await ordersCollection
        .doc(order.orderId) // هون الـ ID صار ثابت ومنظّم
        .set(order.toMap());
    return unit;
  }
}
