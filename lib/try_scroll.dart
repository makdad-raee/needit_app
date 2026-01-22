import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/core/manger/cubit/Main%20cubit/main_view_cubit.dart';

class TrySCroll extends StatelessWidget {
  const TrySCroll({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainViewCubit>(
      create: (context) => MainViewCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // ListOfContainers(),
                  ],
                ),
              ),
              // CustomSliverListOFContainers(),
              //  CustomSliverGridGoods(),
            ],
          ),
        ),
      ),
    );
  }
}

// class TryMostPopular extends StatefulWidget {
//   const TryMostPopular({super.key});

//   @override
//   State<TryMostPopular> createState() => _TryMostPopularState();
// }

// class _TryMostPopularState extends State<TryMostPopular>
//     with TickerProviderStateMixin {
//   late TabController tabController;

//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 9, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     //TabController tabController = TabController(length: 5, vsync: this);
//     return BlocConsumer<MainViewCubit, MainViewState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var allPopularcubit = MainViewCubit.get(context).allPopular;
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Most Popular', style: ktextStyle18),
//             const SizedBox(
//               height: 12,
//             ),
//             TabBar(controller: tabController, isScrollable: true, tabs: [
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//               Tab(
//                 child: Container(
//                   height: 50,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//               ),
//             ]),
//             Container(
//               width: double.maxFinite,
//               height: 500,
//               child: TabBarView(
//                   physics: const BouncingScrollPhysics(),
//                   controller: tabController,
//                   children: const [
//                     GoodsForSale(),
//                     Text(
//                       'Clothes dddddddddddddddddddddddddddd',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'elec',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'bags',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'toys',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'jewelry',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'kitchen',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'watch',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     Text(
//                       'Shoes',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ]),
//             )
//           ],
//         );
//       },
//     );
//   }
// }

// class TryTabBarMostPopular extends StatelessWidget {
//   const TryTabBarMostPopular({
//     super.key,
//     required this.tabController,
//     required this.allPopularcubit,
//   });

//   final TabController tabController;
//   final List<Popular> allPopularcubit;

//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//         padding: const EdgeInsets.all(0),
//         controller: tabController,
//         isScrollable: true,
//         tabAlignment: TabAlignment.start,
//         labelPadding: const EdgeInsets.only(right: 14),
//         tabs: [
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: const Center(
//                   child: Text(
//                 'All',
//                 style: TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit.where((element) => element.id == 8).first.name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit.where((element) => element.id == 9).first.name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit
//                     .where((element) => element.id == 10)
//                     .first
//                     .name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit
//                     .where((element) => element.id == 11)
//                     .first
//                     .name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit
//                     .where((element) => element.id == 12)
//                     .first
//                     .name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit
//                     .where((element) => element.id == 13)
//                     .first
//                     .name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit
//                     .where((element) => element.id == 14)
//                     .first
//                     .name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 28,
//               width: 64,
//               //   padding: EdgeInsetsDirectional.all(8),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadiusDirectional.circular(18)),
//               child: Center(
//                   child: Text(
//                 allPopularcubit
//                     .where((element) => element.id == 15)
//                     .first
//                     .name!,
//                 style: const TextStyle(color: Colors.white),
//               )),
//             ),
//           ),
//         ]);
//   }
// }
