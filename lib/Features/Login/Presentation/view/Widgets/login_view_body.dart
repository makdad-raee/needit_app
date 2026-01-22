import 'package:flutter/material.dart';
import 'package:needit_app/Features/Login/Presentation/view/Widgets/lofin_container_option.dart';
import 'package:needit_app/Features/Login/Presentation/view/Widgets/login_diveder.dart';
import 'package:needit_app/Features/Login/Presentation/view/login_fields_view.dart';
import 'package:needit_app/Features/Sign_Up/Presentation/view/sign_up_view.dart';
import 'package:needit_app/constant.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.045),
        Image.asset('assets/images/loginv.png'),
        const SizedBox(height: 12),
        Text(
          'Let’s You In',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 22,
            fontFamily: kRubikRubikMedium,
          ),
        ),
        const SizedBox(height: 14),
        const LoginContainersOptions(
          text: 'Continue with Facebook',
          asset: 'assets/images/facebooksvg.svg',
        ),
        const SizedBox(height: 24),
        const LoginContainersOptions(
          text: 'Continue with Google',
          asset: 'assets/images/GrGoogle.svg',
        ),
        const SizedBox(height: 24),
        const LoginContainersOptions(
          text: 'Continue with Apple',
          asset: 'assets/images/applesvg.svg',
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.055),
        const LoginDivider(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.045),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginFieldsView()),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              //  border: Border.all(width: 1, color: kprimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: kSwiss721Bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account?  ',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 10,
                fontFamily: kSwiss721Bold,
                color: Colors.black45,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignUpView()),
                );
              },
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: Theme.of(context).primaryColor,
                  fontFamily: kSwiss721Bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
