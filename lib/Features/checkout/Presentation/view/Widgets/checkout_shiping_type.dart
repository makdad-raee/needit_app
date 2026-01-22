import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/constant.dart';

class CheckoutShipingType extends StatelessWidget {
  const CheckoutShipingType({super.key});

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
            // Color(0xff00000017),
            spreadRadius: 0,
            blurRadius: 20,
            //  /   blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/cartypesvg.svg',

                ///   color: kprimaryColor,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Choose Shipping Type',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: kRubikRubikMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset('assets/images/arrowrightiphone.svg'),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
