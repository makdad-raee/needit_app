// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:needit_app/Features/Shopping/presentaion/bloc/Shop%20bloc/shop_bloc.dart';
// import 'package:needit_app/Features/Shopping/view/widgets/shoping_view_body.dart';
// import 'package:needit_app/core/widgets/loading_widgets.dart';

// class HomeViewShop extends StatelessWidget {
//   const HomeViewShop({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopBloc, ShopState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         if (state is ShopLoading) {
//           return const LoadingWidgets();
//         } else if (state is ShopLoaded) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               BlocProvider.of<ShopBloc>(context).add(GetAllMainEvent());
//             },
//             child: HomeViewBodyShop(
//               mainS: state.main,
//               offerS: state.offer,
//               popularS: state.popular,
//               shoes: state.clothes,
//               bags: state.bags,
//               clothes: state.clothes,
//               electronic: state.electronics,
//               jewelry: state.jwelry,
//               kitchen: state.kitchen,
//               toys: state.toys,
//               watch: state.watch,
//             ),
//           );
//         } else if (state is ShopError) {
//           return RefreshIndicator(
//             onRefresh: () async {
//               BlocProvider.of<ShopBloc>(context).add(GetAllMainEvent());
//             },
//             child: const Center(child: Text('Erorr')),
//           );
//         }

//         return RefreshIndicator(
//           onRefresh: () async {
//             BlocProvider.of<ShopBloc>(context).add(GetAllMainEvent());
//           },
//           child: const LoadingWidgets(),
//         );
//       },
//     );
//   }
// }
