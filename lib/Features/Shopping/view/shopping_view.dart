import 'package:flutter/material.dart';
import 'package:needit_app/Features/Account/Presentation/View/acoount_view.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/views/my_cart.dart';
import 'package:needit_app/Features/Orders/Presentation/View/order_view.dart';
import 'package:needit_app/Features/Shopping/view/widgets/home_view_shop.dart';
import 'package:needit_app/constant.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({super.key});

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeViewShop(),
    MyCartView(),
    OrderView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 3),
            ],
            border: const Border(
              top: BorderSide(width: 0.5, color: Colors.white),
              right: BorderSide(width: 0.5, color: Colors.white),
              left: BorderSide(width: 0.5, color: Colors.white),
            ),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              selectedLabelStyle: const TextStyle(fontSize: 12),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              unselectedItemColor: Colors.black38,
              selectedItemColor: Theme.of(context).primaryColor,
              currentIndex: currentIndex,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              items: bottomNavigationBarItems(context),
            ),
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(width: 0.5, color: Colors.black),
            right: BorderSide(width: 0.5, color: Colors.black),
            left: BorderSide(width: 0.5, color: Colors.black),
          ),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.black38,
            selectedItemColor: kprimaryColor,
            backgroundColor: Colors.grey[500],
            //currentIndex: cubit.currentIndex,
            onTap: (value) {
              // cubit.changeBottomNav(value);
            },
            items: bottomNavigationBarItems(context),
          ),
        ),
      ),
    );
  }
}
