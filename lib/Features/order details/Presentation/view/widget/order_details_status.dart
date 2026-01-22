import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class OrderDetailsStatus extends StatelessWidget {
  const OrderDetailsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Status',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 14),
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.check, size: 18, color: Colors.white),
            ),
            SizedBox(width: 2),
            Text(
              '-------',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikRegular,
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.check, size: 18, color: Colors.white),
            ),
            SizedBox(width: 1),
            Text(
              '-------',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikRegular,
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.check, size: 18, color: Colors.white),
            ),
            SizedBox(width: 1),
            Text(
              '-------',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikRegular,
                fontSize: 17,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.check, size: 18, color: Colors.white),
            ),
            SizedBox(width: 1),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Arrived at Sorting Hub',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikRegular,
                color: Color(0xff9F9F9F),
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              '30 Oct 2024',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: kRubikRubikRegular,
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 22),
        Divider(thickness: 1),
        SizedBox(height: 22),
        Text(
          'Shipping Adress',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedam, quis nostrud exercitation',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikRegular,
            color: Color(0xff9F9F9F),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
