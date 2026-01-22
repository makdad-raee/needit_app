import 'package:flutter/material.dart';
import 'package:needit_app/Features/checkout/Presentation/view/promo_code_view.dart';
import 'package:needit_app/constant.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => PromoCodeView()));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 42,
              width: MediaQuery.of(context).size.width * 0.77,
              decoration: BoxDecoration(
                color: const Color(0xffEDEDED),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    'Enter Promo Code',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontFamily: kRubikRubikRegular,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const SearchFilterView(),
              // ));
            },
            child: Container(
              height: 40,
              width: 42,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add),
              //  Image.asset('assets/images/slider_up.png'),
            ),
          ),
        ],
      ),
    );
  }
}
