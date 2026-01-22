import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/view/widgets/show_all_offers_body.dart';
import 'package:needit_app/constant.dart';

class SeeAllOffersView extends StatelessWidget {
  const SeeAllOffersView({super.key, required this.offers});
  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 22),
        //     child: SvgPicture.asset('assets/images/searchsvvg.svg'),
        //   )
        // ],
        centerTitle: true,
        title: Text(
          'Special Offers',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontFamily: kSwiss721Bold),
        ),
      ),
      body: ShowAllOfferBody(offers: offers),
    );
  }
}
