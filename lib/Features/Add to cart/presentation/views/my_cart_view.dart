import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_event.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/cart_state.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/empty_cart.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/my_cart_view_body.dart';
import 'package:needit_app/Features/checkout/Presentation/view/checkout_view.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/loading_widgets.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  @override
  void initState() {
    // استدعاء السلة المخزنة بمجرد فتح الشاشة
    context.read<CartBloc>().add(LoadCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        // 1. حالة التحميل (أول مرة فقط)
        if (state.isLoading && state.cart.items.isEmpty) {
          return const Scaffold(body: Center(child: LoadingWidgets()));
        }

        // 2. حالة السلة فارغة
        if (state.cart.items.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: const Text('My Cart')),
            body: EmptyCartWidget(),
          );
        }

        // 3. عرض السلة (نجاح التحميل)
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'My Cart (${state.cart.items.length})',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kSwiss721Bold,
                fontSize: 22,
              ),
            ),
            actions: const [
              Icon(Icons.search, size: 30, color: kprimaryColor),
              SizedBox(width: 20),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                // جسم السلة الذي يحتوي على المنتجات
                Expanded(child: MyCartViewBody(myCart: state.cart.items)),

                // زر الدفع (Checkout) مع السعر الإجمالي
                _buildCheckoutSection(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckoutSection(BuildContext context, CartState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Price:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${state.cart.totalPrice.toStringAsFixed(2)} \$',
                style: const TextStyle(
                  fontSize: 18,
                  color: kprimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => CheckoutView(
                        cartList: state.cart.items,
                        subTotal: state.cart.totalPrice,
                      ),
                ),
              );
              // هنا تنادي حدث الـ Checkout الذي تكلمنا عنه
              // context.read<CartBloc>().add(CheckoutEvent());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Checkout',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
