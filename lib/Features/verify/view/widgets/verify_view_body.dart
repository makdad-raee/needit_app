import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:needit_app/constant.dart';

class VeriftyViewBody extends StatelessWidget {
  const VeriftyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Code has been send to\n nada-jbour@yourdomain.com',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikRegular,
            ),
            textAlign: TextAlign.center,
          ),
          VerificationCode(
            fullBorder: true,

            itemSize: 50,
            margin: const EdgeInsets.all(10),
            onEditing: (value) {
              print(value);
              if (value != true) {
                print('oooooooooooooooo');
                print('Navigate');
              }
            },
            onCompleted: (value) {
              print(value);
              //Value users input it
            },
            textStyle: const TextStyle(fontSize: 20.0, color: kprimaryColor),
            keyboardType: TextInputType.number,
            underlineColor:
                kprimaryColor, // If this is null it will use primaryColor: Colors.red from Theme
            length: 4,
            cursorColor:
                kprimaryColor, // If this is null it will default to the ambient
          ),
          Text(
            'Resend code in 55 s',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: kRubikRubikRegular,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Verify",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontFamily: kSwiss721Bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
