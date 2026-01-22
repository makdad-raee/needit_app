import 'package:flutter/material.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/offer_entity.dart';
import 'package:needit_app/Features/Shopping/view/widgets/offer_item.dart';
import 'package:needit_app/Features/product_details/views/produst_details.dart';

class ShowAllOfferBody extends StatelessWidget {
  const ShowAllOfferBody({super.key, required this.offers});
  final List<OfferEntity> offers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => ProductDetailsView(
                        id: offers[index].productEntity.id,
                      ),
                ),
              );
            },
            child: OffersItem(offer: offers[index]),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 21),
      itemCount: offers.length,
    );
    //  OffersItem(offer: offers,);
  }
}
