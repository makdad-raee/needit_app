import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class GoodsForSale extends StatelessWidget {
  const GoodsForSale({super.key});
  //final Popular popularModel;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        //  crossAxisSpacing: 0
      ),
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Image.asset(
                      'assets/images/irene-kredenets-tcVH_BwHtrc-unsplash-removebg-preview 1.png',
                    ),
                  ),
                  const Text('Snake Leather Bag', style: ktextStyle16),
                  Row(
                    children: [
                      const Icon(Icons.star_half),
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 2,
                          height: 10,
                          decoration: const BoxDecoration(color: kprimaryColor),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE7E7E7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('8.795 sold'),
                      ),
                    ],
                  ),
                  Text(
                    ' \$458.00',
                    style: ktextStyle16.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
      itemCount: 10,
    );
  }
}
