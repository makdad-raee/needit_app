import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/Login/Domain/usecase/login_use_case.dart';
import 'package:needit_app/Features/Login/Presentation/Bloc/login_bloc.dart';
import 'package:needit_app/Features/Login/Presentation/view/Widgets/login_fields_view_body.dart';
import 'package:needit_app/injection_container.dart';

class LoginFieldsView extends StatelessWidget {
  const LoginFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginBloc(
            loginWhithEmilAndpasswordUsecase:
                sl.call<LoginWhithEmilAndpasswordUsecase>(),
          ),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30,
            ), //EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back, size: 30),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {},
              builder: (context, state) => LoginFieldsBody(),
            ),
          ),
        ),
      ),
    );
  }
}
