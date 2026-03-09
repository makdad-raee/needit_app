import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_event.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_state.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class ChooseViewBody extends StatefulWidget {
  const ChooseViewBody({super.key});

  @override
  State<ChooseViewBody> createState() => _ChooseViewBodyState();
}

class _ChooseViewBodyState extends State<ChooseViewBody> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder:
          (context, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomScrollView(
              slivers: [
                SliverList.separated(
                  itemCount: state.shippingMethods.length,
                  itemBuilder: (context, index) {
                    final method = state.shippingMethods[index];
                    // 4. التحقق من الاختيار بناءً على الـ Bloc أو الـ index المحلي
                    bool isSelected =
                        state.selectedShippingMethod?.name == method.name;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        // 5. إرسال الحدث للـ Bloc فور النقر
                        context.read<CheckoutBloc>().add(
                          SelectShippingMethod(method),
                        );
                      },
                      child: ShippingTypeItem(
                        // 6. تمرير البيانات الحقيقية من الـ method
                        svgPath: 'assets/images/sequereeconomy.svg',
                        price: method.price.toString(),
                        text: method.name,
                        isSelected: isSelected,
                      ),
                    );
                  },

                  separatorBuilder: (context, index) => SizedBox(height: 22),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ContinueBottom(
                    text: 'Apply',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            //  Column(
            //   children: [
            //     ShippingTypeItem(
            //       SvgPath: 'assets/images/sequereeconomy.svg',
            //       price: '50',
            //       text: 'Economy',
            //     ),
            //     SizedBox(
            //       height: 22,
            //     ),
            //     ShippingTypeItem(
            //       SvgPath: 'assets/images/sequereeconomy.svg',
            //       price: '30',
            //       text: 'Regular',
            //     ),
            //     SizedBox(
            //       height: 22,
            //     ),
            //     ShippingTypeItem(
            //       SvgPath: 'assets/images/cartypesvg.svg',
            //       price: '50',
            //       text: 'Cargo',
            //     ),
            //     SizedBox(
            //       height: 22,
            //     ),
            //     ShippingTypeItem(
            //       SvgPath: 'assets/images/cartypesvg.svg',
            //       price: '19',
            //       text: 'Express',
            //     ),
            //     Spacer(),
            //     ContinueBottom(
            //       text: 'Apply',
            //     ),
            //   ],
            // ),
          ),
    );
  }
}

//sequereeconomy
class ShippingTypeItem extends StatelessWidget {
  const ShippingTypeItem({
    super.key,
    required this.svgPath,
    required this.text,
    required this.price,
    this.isSelected = false,
  });
  final String svgPath;
  final String text;
  final String price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff00000017),

            spreadRadius: 0,
            blurRadius: 20,

            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: SvgPicture.asset(
                  svgPath,

                  ///   color: kprimaryColor,
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: kRubikRubikMedium,
                    ),
                  ),
                  Text(
                    'Delivery: 2-3 days',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                      color: const Color(0xff9F9F9F),
                      fontWeight: FontWeight.w400,
                      fontFamily: kRubikRubikRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            '$price\$',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikMedium,
            ),
          ),
          SizedBox(width: 2),
          isSelected ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
