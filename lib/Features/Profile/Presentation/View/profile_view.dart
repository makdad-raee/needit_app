import 'package:flutter/material.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/Profile_view_body.dart';
import 'package:needit_app/constant.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
          'Fill Your Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontFamily: kRubikRubikMedium,
          ),
        ),
      ),
      body: ProfileViewBody(),
    );
  }
}
