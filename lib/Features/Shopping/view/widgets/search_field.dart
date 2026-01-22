import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 42,
          color: const Color(0xFFF5F5F5),
          width: MediaQuery.of(context).size.width * 0.77,
          child: TextFormField(
            cursorHeight: 16,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(-25),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Colors.grey.withOpacity(0.8),
              ),
              hintText: 'Bags',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kprimaryColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kprimaryColor, width: 2),
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 40,
          width: 42,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
            //    border: Border.all(color: kprimaryColor, width: 1)
          ),
          child: Image.asset('assets/images/slider_up.png'),
        ),
      ],
    );
  }
}
