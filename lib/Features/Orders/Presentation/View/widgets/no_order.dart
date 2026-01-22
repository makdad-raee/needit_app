import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class NoOrderWidgets extends StatelessWidget {
  const NoOrderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/notebookpng.png'),
        SizedBox(height: 40),
        NoOrderWidgetsSection2(),
      ],
    );
  }
}

class NoOrderWidgetsSection2 extends StatelessWidget {
  const NoOrderWidgetsSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'You have not placed any orders yet',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikMedium,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'You don’t have an ongoing orders at this time',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikRegular,
            ),
          ),
        ],
      ),
    );
  }
}
