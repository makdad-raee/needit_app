import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class orderPriceDetails extends StatelessWidget {
  const orderPriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color(0xffEDEDED),
            offset: Offset(0, 0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'SubTotal',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: kRubikRubikRegular,
                  fontSize: 12,
                  color: Color(0xff9F9F9F),
                ),
              ),
              Spacer(),
              Text(
                '\$850.00',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 16,
                  color: Color(0xff9F9F9F),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Shipping Fee',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: kRubikRubikRegular,
                  fontSize: 12,
                  color: Color(0xff9F9F9F),
                ),
              ),
              Spacer(),
              Text(
                '\$15.00',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 16,
                  color: Color(0xff9F9F9F),
                ),
              ),
            ],
          ),
          Divider(thickness: 0.6, color: Color(0xff9F9F9F)),
          Row(
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 12,
                  color: Color(0xff9F9F9F),
                ),
              ),
              Spacer(),
              Text(
                '\$600.00',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontFamily: kRubikBold,
                  fontSize: 16,
                  color: Color(0xff9F9F9F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
