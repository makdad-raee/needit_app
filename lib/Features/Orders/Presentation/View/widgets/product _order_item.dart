import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class ProductOfOrderItem extends StatelessWidget {
  const ProductOfOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0, 0),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Container(
              height: 117,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                // border: Border.all(color: Colors.grey, width: 1),
                color: Colors.white,
              ),
              child: Image.network(
                fit: BoxFit.contain,
                // cartList.imageUrl ??
                'https://img.freepik.com/free-photo/men-shoes_1203-8652.jpg?t=st=1734897670~exp=1734901270~hmac=76e523bf76970ba600c7e20ef12e1f00fc798f80cc28b4ba471ee8dd8e5e1bf8&w=740',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        //width: 120,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            'Werolla Cardigans',
                            //  cartList.name,
                            //   overflow: TextOverflow.ellipsis,
                            //  maxLines: 1,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              fontFamily: kRubikRubikMedium,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    '385.00 \$',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.blue.shade900,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Color',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontFamily: kRubikRubikRegular,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
