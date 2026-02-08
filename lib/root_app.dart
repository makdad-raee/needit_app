import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/my_cart_bloc.dart';
import 'package:needit_app/Features/Home/views/home_view.dart';
import 'package:needit_app/Features/Shopping/presentaion/bloc/Shop%20bloc/shop_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/clothes_bags_etc/presentation/bloc/bloc/products_of_category_bloc.dart';
import 'package:needit_app/Features/product_details/presentation/bloc/details_bloc_bloc.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/Auth%20Bloc/auth_bloc.dart';
import 'package:needit_app/core/Auth%20Bloc/auth_event.dart';
import 'injection_container.dart' as di;

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
        BlocProvider(
          create: (context) => di.sl<ShopBloc>()..add(GetAllMainEvent()),
        ),
        BlocProvider(create: (context) => di.sl<DetailsBlocBloc>()),
        BlocProvider(
          create: (context) => di.sl<MyCartBloc>()..add(GetAllCartEvent()),
        ),
        BlocProvider(
          create:
              (context) =>
                  di.sl<ProductsOfCategoryBloc>()
                    ..add(GetAllProductsOfCategroyEvent(id: 8)),
          child: Container(),
        ),
        BlocProvider(create: (context) => di.sl<CheckoutBloc>()),
      ],
      child: MaterialApp(
        title: 'Needit App',
        themeMode: ThemeMode.light,
        darkTheme: darkTheme,

        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
