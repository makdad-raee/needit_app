import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class AmmountShippingTotal extends StatelessWidget {
  const AmmountShippingTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Amount',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontFamily: kRubikRubikRegular,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Text(
                '\$850.00',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontFamily: kRubikRubikRegular,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            'Shipping',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontFamily: kRubikRubikRegular,
              color: Colors.grey,
            ),
          ),
          Spacer(),
          Text(
            'Total',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontFamily: kRubikRubikRegular,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
