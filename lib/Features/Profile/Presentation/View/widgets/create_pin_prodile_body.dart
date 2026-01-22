import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:needit_app/Features/Profile/Presentation/View/reset_password_view.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';

class CreatePinForProifileBody extends StatelessWidget {
  const CreatePinForProifileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Add a PIN number to make your account\n more secure',
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
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 22,
              fontFamily: kRubikRubikRegular,
            ),
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
          ContinueBottom(
            onTap: () {
              showDeleteDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      //  barrierColor: Colors.red.withOpacity(0.1),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: AlertDialog(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            iconPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(0),
            titlePadding: const EdgeInsets.symmetric(horizontal: 20),
            buttonPadding: const EdgeInsets.all(0),
            actionsPadding: const EdgeInsets.all(20),
            backgroundColor: Colors.white,
            // surfaceTintColor: Colors.white.withOpacity(0.1),
            title: Container(
              //    width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(29),
                  topRight: Radius.circular(29),
                ),
                // color: Colors.white,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 51),
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: SvgPicture.asset('assets/images/personCon.svg'),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Congratulations!',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      //    color: Color(0xff06070999),
                      fontSize: 22,
                      fontFamily: kRubikRubikMedium,
                    ),
                  ),
                ],
              ),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(29),
                        bottomRight: Radius.circular(29),
                      ),
                      //  color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        Text(
                          'Your account is ready to use you will be redirected to the Home page in few seconds',
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontFamily: kRubikRubikRegular,
                          ),
                        ),
                        SizedBox(height: 10),
                        CircularProgressIndicator(color: kprimaryColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Dismiss the dialog
                    },
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 58),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Skip',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontFamily: kRubikBold, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordView(),
                        ),
                      );
                      // Navigator.of(context).pop(); // Dismiss the dialog
                    },
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontFamily: kRubikBold, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
