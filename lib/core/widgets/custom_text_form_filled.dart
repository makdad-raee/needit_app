import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class CostomTextFormFilled extends StatelessWidget {
  const CostomTextFormFilled({
    super.key,
    required this.text,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
  });
  final String text;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      style: TextStyle(fontSize: 18),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Cant be Empty";
        } else {
          return null;
        }
      },
      cursorColor: kprimaryColor,
      cursorHeight: 24,
      decoration: InputDecoration(
        fillColor: const Color(0xffF5F5F5),
        filled: true,
        hintText: text,

        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 12,
          fontFamily: kRubikRubikMedium,
          color: Colors.black38,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.all(15),
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 12,
          fontFamily: kRubikRubikMedium,
          color: Colors.black38,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kprimaryColor, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
