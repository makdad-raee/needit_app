import 'package:flutter/material.dart';

import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/view/Widgets/edit_address_view_body.dart';
import 'package:needit_app/constant.dart';

class EditAddressView extends StatelessWidget {
  final AddressEntity? address;

  const EditAddressView({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          address == null
              ? 'Add New Address'
              : 'Edit Address', // تغيير العنوان ديناميكياً
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 18,
          ),
        ),
      ),
      // أزلنا const ومررنا العنوان
      body: EditAddressBody(address: address),
    );
  }
}
