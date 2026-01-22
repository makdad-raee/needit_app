import 'package:flutter/material.dart';
import 'package:needit_app/Features/Sign_Up/Presentation/view/sign_up_view.dart';
import 'package:needit_app/Features/Sign_Up/Presentation/view/widgets/sign_up_view_body.dart';
import 'package:needit_app/constant.dart';

class LoginFieldsBody extends StatelessWidget {
  const LoginFieldsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Login to Your \nAccount',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 40,
              fontFamily: kRubikRubikMedium,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                child: const CostomTextFormFilled(
                  text: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: const CostomTextFormFilled(
                  text: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontFamily: kRubikRubikMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    // border: Border.all(width: 1, color: kprimaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontFamily: kRubikRubikMedium,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Forgot the password?',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontFamily: kRubikRubikMedium,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const SignUpDiveder(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const FaceBookAppleGoogleContainers(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      color: Colors.black45,
                      fontFamily: kSwiss721Bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        color: Theme.of(context).primaryColor,
                        fontFamily: kSwiss721Bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ],
      ),
    );
  }
}
