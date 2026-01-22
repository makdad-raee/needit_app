import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:needit_app/constant.dart';

class TwoCrcleAvatarCategories extends StatelessWidget {
  const TwoCrcleAvatarCategories({
    super.key,
    this.onTapTop,
    this.onTapBottom,
    required this.pathTop,
    required this.pathBottom,
    required this.nameTop,
    required this.namebottom,
  });
  final void Function()? onTapTop;
  final void Function()? onTapBottom;
  final String pathTop;
  final String pathBottom;
  final String nameTop;
  final String namebottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTapTop,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xffECECEC),
            child: SvgPicture.network(pathTop, height: 26),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          nameTop,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 10,
            fontFamily: kSwiss721Bold,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTapBottom,
          child: CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xffECECEC),
            child: SvgPicture.network(pathBottom, height: 26),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          namebottom,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 10,
            fontFamily: kSwiss721Bold,
          ),
        ),
      ],
    );
  }
}
