import 'package:flutter/material.dart';

import 'package:needit_app/Features/checkout/Presentation/view/Widgets/shipping_address_body.dart';
import 'package:needit_app/constant.dart';
// تأكد من الاسم

// 1. الشاشة الرئيسية
class ShippingAddress extends StatelessWidget {
  final bool isFromProfile; // المتغير السحري

  const ShippingAddress({super.key, this.isFromProfile = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          isFromProfile ? 'Address' : 'Shipping Address', // تغيير ذكي للعنوان
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ShippingAddressBody(
          isFromProfile: isFromProfile,
        ), // نمرر المتغير
      ),
    );
  }
}
