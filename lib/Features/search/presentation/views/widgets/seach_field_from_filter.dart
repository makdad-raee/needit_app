import 'package:flutter/material.dart';

class SearchFieldFromFilter extends StatelessWidget {
  const SearchFieldFromFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 42,
          color: const Color(0xffEDEDED),
          width: MediaQuery.of(context).size.width * 0.77,
          child: TextFormField(
            style: TextStyle(fontSize: 18),
            cursorHeight: 18,
            decoration: InputDecoration(
                isDense: true,
                hintMaxLines: 5,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.grey.withOpacity(0.8),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xffEDEDED), width: 1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xffEDEDED), width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xffEDEDED), width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xffEDEDED), width: 1))),
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
        )
      ],
    );
  }
}
