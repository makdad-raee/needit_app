import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  // فصلنا الـ Logic بدالة مستقلة لتبقى واجهة الـ UI نظيفة
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      // لاحقاً هنا يمكنك استدعاء الـ Bloc لرفع الصورة للسيرفر
      // context.read<ProfileBloc>().add(UploadImageEvent(_pickedImage!));
    } else {
      debugPrint('No Image Selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // دمجنا الحالتين بـ CircleAvatar واحد فقط
        CircleAvatar(
          radius: 67,
          backgroundColor: const Color.fromARGB(255, 7, 5, 5),
          backgroundImage:
              _pickedImage == null
                  ? const AssetImage('assets/images/girls2.png')
                      as ImageProvider
                  : FileImage(_pickedImage!),
        ),
        Positioned(
          bottom: 5,
          right: 16,
          child: GestureDetector(
            onTap: _pickImage, // استدعاء الدالة بشكل نظيف جداً
            child: Container(
              padding: const EdgeInsets.all(4),
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
