import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/constant.dart';

class ProductDetailsSection2 extends StatelessWidget {
  const ProductDetailsSection2({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17, left: 17, top: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  detailsModel.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 28,
                    fontFamily: kSwiss721Bold,
                    //fontWeight: FontWeight.w400,
                    //fontStyle: FontStyle.italic,
                  ),
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 3,
                ),
              ),
              const Spacer(),
              SvgPicture.asset('kHeartSvgPath'),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xffE7E7E7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${detailsModel.totalSold} sold',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                    fontFamily: kSwiss721Bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.star_half),
              Text(
                detailsModel.rate.toString(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  // fontSize: 10,
                  fontFamily: kSwiss721Bold,
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
              Text(
                '(4.749  reviews)',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontFamily: kSwiss721Bold,
                ),
              ),
            ],
          ),
          Divider(thickness: 1, color: Colors.grey.withOpacity(0.5)),
        ],
      ),
    );
  }
}
