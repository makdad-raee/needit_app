import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/constant.dart';

class OptionProfile extends StatelessWidget {
  const OptionProfile({
    super.key,
    required this.text,
    required this.svgPath,
    this.onTap,
  });
  final String text;
  final String svgPath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(svgPath),
          SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikRegular,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
