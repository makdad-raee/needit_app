import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:needit_app/Features/Orders/Data/models/order_model.dart';
import 'package:needit_app/Features/checkout/Domain/Repositories/check_out_repo.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> placeOrder(OrderModel order) async {
    try {
      // حفظ الطلب في كولكشن orders العام
      await _firestore
          .collection('orders')
          .doc(order.orderId)
          .set(order.toMap());

      // (اختياري) حفظ مرجع للطلب داخل بيانات المستخدم لتسهيل العرض لاحقاً
      await _firestore
          .collection('users')
          .doc(order.userId)
          .collection('my_orders')
          .doc(order.orderId)
          .set({'orderId': order.orderId, 'createdAt': DateTime.now()});
    } catch (e) {
      throw Exception("فشل في إرسال الطلب: $e");
    }
  }

  @override
  Future<List<OrderModel>> getMyOrders(String userId) {
    // TODO: implement getMyOrders
    throw UnimplementedError();
  }
}
