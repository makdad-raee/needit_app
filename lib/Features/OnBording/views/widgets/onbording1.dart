import 'package:flutter/material.dart';

class Onbording1 extends StatelessWidget {
  const Onbording1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffD9D9D9),
            ),
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/images/black.png'),
              ],
            )),
        const SizedBox(
          height: 45,
        ),
        Text(
          'We provide high \nquality products just \nfor you',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500, fontFamily: 'RubikMedium'),
        )
      ],
    );
  }
}
