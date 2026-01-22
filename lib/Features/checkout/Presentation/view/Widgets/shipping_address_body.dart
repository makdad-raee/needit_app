import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/checkout/Domain/entities/location_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class ShippingAddressBody extends StatefulWidget {
  const ShippingAddressBody({super.key});

  @override
  State<ShippingAddressBody> createState() => _ShippingAddressBodyState();
}

class _ShippingAddressBodyState extends State<ShippingAddressBody> {
  List<bool> isSelected = [false, false, false, false, false];
  void changeColor(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList.separated(
                separatorBuilder: (context, index) => SizedBox(height: 22),
                itemCount: 5,
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        changeColor(index);
                        setState(() {});
                      },
                      child: AddressItem(isSelected: isSelected[index]),
                    ),
              ),
              // SliverFillRemaining(
              //   hasScrollBody: false,

              //   child: ShippingBodySection2(),
              // )
            ],
          ),
        ),
        ShippingBodySection2(),
      ],
    );
  }
}

class ShippingBodySection2 extends StatelessWidget {
  const ShippingBodySection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        ContinueBottom(
          containerColor: Color(0xffEDEDED),
          text: 'Add New Address',
        ),
        SizedBox(height: 60),
        ContinueBottom(
          text: 'Apply',
          onTap: () {
            BlocProvider.of<CheckoutBloc>(context).add(
              AddlocationEvent(
                locationEntity: LocationEntity(
                  logo: 'loge',
                  name: "Latakia",
                  details: "Lattakia -al zerraaa",
                ),
              ),
            );
            Navigator.of(context).pop();
          },
        ),
        SizedBox(height: 18),
      ],
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, this.isSelected = false});
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
                  'assets/images/locationcheck.svg',

                  ///   color: kprimaryColor,
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Home',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: kRubikRubikMedium,
                    ),
                  ),
                  Text(
                    '61480 Sunbrook Park , PC 5679',
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
          isSelected == false
              ? Icon(Icons.circle_outlined)
              : Icon(Icons.circle),
          // SvgPicture.asset('assets/images/editcheck.svg'),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
