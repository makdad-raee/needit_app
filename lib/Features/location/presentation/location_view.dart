import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_bloc.dart';
import 'package:needit_app/core/get_products/presentation/bloc/get_products_bloc_state.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductsBloc, GetProductsState>(
      listener: (context, state) {},
      builder:
          (context, state) => Scaffold(
            appBar: AppBar(title: const Text('Location')),
            body: const Center(child: Text('Location View')),
          ),
    );
  }
}
