import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/custom_text_form_filled.dart';

class PasswordFilled extends StatefulWidget {
  const PasswordFilled({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordFilled> createState() => _PasswordFilledState();
}

class _PasswordFilledState extends State<PasswordFilled> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CostomTextFormFilled(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      text: 'Password',
      prefixIcon: Icon(Icons.lock, color: Colors.black38),
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child:
            obscureText
                ? Icon(Icons.visibility, color: Colors.black38)
                : Icon(Icons.visibility_off, color: Colors.black38),
      ),
    );
  }
}

class AlreadyHaveAcoount extends StatelessWidget {
  const AlreadyHaveAcoount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 10,
            fontFamily: kSwiss721Bold,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const SignUpView()));
          },
          child: Text(
            'Login? ',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 10,
              color: Theme.of(context).primaryColor,
              fontFamily: kSwiss721Bold,
            ),
          ),
        ),
      ],
    );
  }
}
