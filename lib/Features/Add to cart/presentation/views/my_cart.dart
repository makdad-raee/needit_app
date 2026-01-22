import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/my_cart_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/my_cart_view_body.dart';
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
    BlocProvider.of<MyCartBloc>(context).add(GetAllCartEvent());
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCartBloc, MyCartState>(
      builder: (context, state) {
        if (state is MyCartLoading) {
          if (cartentityNotifer.value.isEmpty) {
            //  totalPRice.value = 0.0;
          }
          return const LoadingWidgets();
        } else if (state is MyCartLoaded) {
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'My Cart',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: kSwiss721Bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              //  centerTitle: true,
              actions: const [
                Icon(Icons.search, size: 30, color: kprimaryColor),
                SizedBox(width: 20),
              ],
            ),
            body: SafeArea(
              child: ValueListenableBuilder(
                valueListenable: cartentityNotifer,
                builder:
                    (context, value, child) => MyCartViewBody(myCart: value),
              ),
            ),
          );
        } else if (cartentityNotifer.value.isEmpty) {
          //  totalPRice.value = 0.0;
          return const Center(child: Text('No data'));
        }
        return const LoadingWidgets();
      },
    );
  }
}
