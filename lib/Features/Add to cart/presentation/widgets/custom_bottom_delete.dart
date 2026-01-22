import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class CustomButtonForDelete extends StatelessWidget {
  const CustomButtonForDelete({
    super.key,
    this.onPressed,
    this.color,
    required this.text,
    required this.textColor,
  });
  final void Function()? onPressed;
  final Color? color;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 145,
        decoration: BoxDecoration(
          color: color ?? kprimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: textColor,
              fontFamily: kRubikBold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
