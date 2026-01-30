import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Login/Domain/usecase/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWhithEmilAndpasswordUsecase loginWhithEmilAndpasswordUsecase;
  LoginBloc({required this.loginWhithEmilAndpasswordUsecase})
    : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginWhithEmailAndPasswordEvent) {
        emit(LoginLoading());
        final result = await loginWhithEmilAndpasswordUsecase.call(
          email: event.email,
          password: event.password,
        );
        result.fold(
          (failure) => emit(Loginfailure(error: failure.message)),
          (userentity) => emit(LoginSuccess(user: userentity)),
        );
      }
    });
  }
}
