import 'package:flutter/material.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/create_pin_profile_body.dart';
import 'package:needit_app/constant.dart';

class CreatePinForProfile extends StatelessWidget {
  const CreatePinForProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // توحيد لون الخلفية
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // لون سهم الرجوع
        title: Text(
          'Create New PIN', // تم التعديل
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 18,
          ),
        ),
      ),
      body: const CreatePinForProfileBody(), // تم التعديل وإضافة const
    );
  }
}
