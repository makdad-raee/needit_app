import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/view/shopping_view.dart';
import 'package:needit_app/constant.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة تعبر عن السلة الفاضية
            Icon(
              Icons.shopping_basket_outlined,
              size: 100,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: kRubikBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your cart is currently empty \n start shopping now!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 30),
            // زر للعودة للتسوق
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoppingView()),
                  (route) =>
                      false, // هاد السطر بيمسح كل الشاشات السابقة عشان ما يصير زحمة بالـ Stack
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Start Shopping',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
