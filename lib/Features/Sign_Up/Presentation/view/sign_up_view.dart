import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:needit_app/Features/Auth/Domain/use%20cases/signup_usecase.dart';
import 'package:needit_app/Features/Auth/presentation/bloc/signup_bloc.dart';
import 'package:needit_app/Features/Sign_Up/Presentation/view/widgets/sign_up_view_body.dart';
import 'package:needit_app/injection_container.dart' as di;

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignupBloc(
          signupUpWhithEmilAndpasswordUsecase:
              di.sl<SignupUpWhithEmilAndpasswordUsecase>(),
        );
      },
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.of(context).pop();
            // push(MaterialPageRoute(builder: (context) => const VerifyView()));
          }
          if (state is Signupfailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder:
            (context, state) => Scaffold(
              body: ModalProgressHUD(
                inAsyncCall: State is SignupLoading ? true : false,
                child: SignUpViewBody(),
              ),
            ),
      ),
    );
  }
}
