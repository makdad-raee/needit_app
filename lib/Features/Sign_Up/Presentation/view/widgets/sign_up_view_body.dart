import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Auth/presentation/bloc/signup_bloc.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/password_filed.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, name, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * .1),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back, size: 30, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * .15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Create Your Account',
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
                          child: CostomTextFormFilled(
                            onSaved: (value) {
                              name = value!;
                            },
                            text: 'Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: CostomTextFormFilled(
                            onSaved: (value) {
                              email = value!;
                            },
                            text: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 60,
                          child: PasswordFilled(
                            onSaved: (value) {
                              password = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                              activeColor: Theme.of(context).primaryColor,
                            ),
                            Text(
                              'Remember me',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                fontFamily: kRubikRubikMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<SignupBloc>(context).add(
                                SignupWhithEmailAndPasswordEvent(
                                  email: email,
                                  password: password,
                                  name: name,
                                ),
                              );
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => const VerifyView(),
                              //   ),
                              // );
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              //      border: Border.all(width: 1, color: kprimaryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  fontFamily: kSwiss721Bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        const SignUpDiveder(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        const FaceBookAppleGoogleContainers(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        const AlreadyHaveAcoount(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaceBookAppleGoogleContainers extends StatelessWidget {
  const FaceBookAppleGoogleContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 63,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffD9D9D9)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            'assets/images/facebooksvg.svg',
            fit: BoxFit.scaleDown,
            // height: 45,
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 45,
          width: 63,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffD9D9D9)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            'assets/images/GrGoogle.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 45,
          width: 63,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xffD9D9D9)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            'assets/images/applesvg.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}

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

class SignUpDiveder extends StatelessWidget {
  const SignUpDiveder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 1,
          color: Colors.grey[400],
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        const SizedBox(width: 4),
        const Text(
          'Or Continue with',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          height: 1,
          color: Colors.grey[400],
          width: MediaQuery.of(context).size.width * 0.2,
        ),
      ],
    );
  }
}
