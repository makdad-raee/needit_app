import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:needit_app/constant.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ValueListenableBuilder(
          valueListenable: imagePiced,
          builder:
              (context, value, child) =>
                  value == null
                      ? CircleAvatar(
                        radius: 67,
                        backgroundColor: const Color.fromARGB(255, 7, 5, 5),
                        backgroundImage: AssetImage('assets/images/girls2.png'),
                      )
                      : CircleAvatar(
                        radius: 67,
                        backgroundColor: const Color.fromARGB(255, 7, 5, 5),
                        backgroundImage: FileImage(value),
                      ),
        ),
        Positioned(
          bottom: 5,
          right: 16,
          child: GestureDetector(
            onTap: () async {
              final pickedImage = await picker.pickImage(
                source: ImageSource.gallery,
              );
              if (pickedImage != null) {
                imagePiced.value = File(pickedImage.path);
                setState(() {});
                //  emit(SocialPickedProfileImageSuccesState());
              } else {
                print('No  Image Selected');
                //  emit(SocialPickedProfileImageSuccesState());
              }
            },
            child: Container(
              padding: EdgeInsets.all(4),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).primaryColor,
              ),
              child: SvgPicture.asset(
                'assets/images/editsvg.svg',
                width: 22,
                height: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
