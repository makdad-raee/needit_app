import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class Onbording2 extends StatelessWidget {
  const Onbording2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.50,
          width: double.infinity,
          decoration: const BoxDecoration(
            //color: kprimaryColor,
          ),
          child: Column(
            children: [const Spacer(), Image.asset('assets/images/girls2.png')],
          ),
        ),
        const SizedBox(height: 45),
        Text(
          'We provide high \nquality products just \nfor you',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: kRubikRubikMedium,
          ),
        ),
      ],
    );
  }
}
