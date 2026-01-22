import 'package:flutter/material.dart';
import 'package:needit_app/Features/OnBording/views/widgets/on_bording_view_body.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      body: SafeArea(child: OnBordingViewBody()),
    );
  }
}
