import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/view/show_all_offers_view.dart';
import 'package:needit_app/Features/Shopping/view/widgets/offer_item.dart';
import 'package:needit_app/Features/product_details/views/produst_details.dart';
import 'package:needit_app/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key, required this.offer});
  final List<OfferEntity> offer;

  @override
  Widget build(BuildContext context) {
    var controller = PageController();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Special Offers',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontFamily: kSwiss721Bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SeeAllOffersView(offers: offer),
                        ),
                      );
                    },
                    child: Text(
                      'See all',
                      style: ktextStyle12.copyWith(
                        fontFamily: kRubikRubikRegular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetailsView(
                                  id: offer[index].productEntity.id,
                                ),
                          ),
                        );
                      },
                      child: OffersItem(offer: offer[index]),
                    ),
                itemCount: offer.length,
                controller: controller,
              ),
            ),
            const SizedBox(height: 18),
            SmoothPageIndicator(
              controller: controller,
              count: offer.length,
              effect: const ScrollingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 3,
                // expansionFactor: 3,
                activeDotColor: kprimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
