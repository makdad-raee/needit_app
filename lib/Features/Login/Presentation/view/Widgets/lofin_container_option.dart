import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/constant.dart';

class LoginContainersOptions extends StatelessWidget {
  const LoginContainersOptions({
    super.key,
    required this.text,
    required this.asset,
  });
  final String text;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(asset),
          const SizedBox(width: 4),
          Column(
            children: [
              const SizedBox(height: 4),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontFamily: kRubikRubikMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
