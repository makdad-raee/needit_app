import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });
  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 53,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 12,
          fontFamily: kRubikRubikMedium,
        ),
        cursorHeight: 22,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: prefixIcon,
          fillColor: Color(0xFFF5F5F5),
          filled: true,
          prefixIconColor: Colors.grey,
          suffixIcon: suffixIcon,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12,
            color: Colors.blueGrey,
            fontFamily: kRubikRubikMedium,
          ),
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12,
            fontFamily: kRubikRubikMedium,
            color: Colors.black38,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: -5, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white, width: 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white, width: 0.1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white, width: 0.1),
          ),
        ),
      ),
    );
  }
}
