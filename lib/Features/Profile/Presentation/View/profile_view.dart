import 'package:flutter/material.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/profile_view_body.dart';
import 'package:needit_app/constant.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontFamily: kRubikRubikMedium,
          ),
        ),
      ),
      body: const ProfileViewBody(), // 👈 أضفنا const هنا
    );
  }
}
