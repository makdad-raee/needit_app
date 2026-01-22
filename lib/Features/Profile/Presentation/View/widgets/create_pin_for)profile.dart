import 'package:flutter/material.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/create_pin_prodile_body.dart';
import 'package:needit_app/constant.dart';

class CreatePinForProifile extends StatelessWidget {
  const CreatePinForProifile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New PiN',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontFamily: kRubikRubikMedium),
        ),
      ),
      body: CreatePinForProifileBody(),
    );
  }
}
