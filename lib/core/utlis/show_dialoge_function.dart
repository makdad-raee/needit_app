import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete  Products'),
        content: const Text('Remove from cart ?.'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: kprimaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text(
              'OK',
              style: TextStyle(
                color: kprimaryColor.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // BlocProvider.of<MyCartBloc>(context).add(
              //     RemoveFromCartEvent(id: cartList.id, cartEntity: cartList));
              // Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
