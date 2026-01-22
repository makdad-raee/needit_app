import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/product_details/presentation/bloc/details_bloc_bloc.dart';
import 'package:needit_app/Features/product_details/views/widgets/product_details_body.dart';
import 'package:needit_app/core/widgets/loading_widgets.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.id});
  final int id;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    BlocProvider.of<DetailsBlocBloc>(
      context,
    ).add(ShowDetailsOfProducts(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailsBlocBloc, DetailsBlocState>(
        builder: (context, state) {
          if (state is DetailsBlocLoading) {
            return const LoadingWidgets();
          } else if (state is DetailsBlocLoadedState) {
            return SafeArea(
              child: ProductDetailsViewBody(detailsModel: state.details),
            );
          } else if (state is DetailsBlocErrorState) {}
          return const LoadingWidgets();
        },
      ),
    );
  }
}
