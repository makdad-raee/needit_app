import 'package:flutter/material.dart';

class ImageAndTitel extends StatelessWidget {
  const ImageAndTitel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/logofinalpn.png',
            ),
          ),
          const SizedBox(
            height: 46,
          ),
        ],
      ),
    );
  }
}
