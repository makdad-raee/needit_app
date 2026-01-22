import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/checkout/Presentation/view/shipping_address.dart';
import 'package:needit_app/constant.dart';
// import 'package:needit_app/Features/checkout/Presentation/view/shipping_address.dart';
// import 'package:needit_app/constant.dart';

class CheckoutLocation extends StatelessWidget {
  const CheckoutLocation({super.key});

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
        // boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.1), blurRadius: 5)],
        // border: Border.all(width: 1, color: Colors.grey[200]!),
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
                  ValueListenableBuilder(
                    valueListenable: locationNotifier,
                    builder:
                        (context, value, child) => Text(
                          value == null ? 'Home' : value.name,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: kRubikRubikMedium,
                          ),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShippingAddress()),
              );
            },
            child: SvgPicture.asset('assets/images/editcheck.svg'),
          ),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
