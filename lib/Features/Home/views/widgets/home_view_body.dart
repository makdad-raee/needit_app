import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:needit_app/Features/OnBording/views/on_bording_view.dart';
import 'package:needit_app/Features/Shopping/presentaion/bloc/Shop%20bloc/shop_bloc.dart';

class HomeViewBOdy extends StatefulWidget {
  const HomeViewBOdy({super.key});

  @override
  State<HomeViewBOdy> createState() => _HomeViewBOdyState();
}

class _HomeViewBOdyState extends State<HomeViewBOdy> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShopBloc>(context).add(GetAllMainEvent());
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) =>
    //         //   const Test()
    //         const OnBordingView(),
    //   ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            'assets/Logo-6-[remix]_light.json',
            repeat: false,
            onLoaded: (p0) {
              Future.delayed(const Duration(seconds: 3), () {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            //   const Test()
                            const OnBordingView(),
                  ),
                );
              });
            },
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
