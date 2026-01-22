import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class ContinueBottom extends StatelessWidget {
  const ContinueBottom({super.key, this.onTap, this.text, this.containerColor});
  final void Function()? onTap;
  final String? text;
  final Color? containerColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: 51,
        decoration: BoxDecoration(
          color: containerColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text ?? 'Continue',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikMedium,
            ),
          ),
        ),
      ),
    );
  }
}
