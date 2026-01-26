import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Auth/Domain/use%20cases/signup_usecase.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUpWhithEmilAndpasswordUsecase signupUpWhithEmilAndpasswordUsecase;
  SignupBloc({required this.signupUpWhithEmilAndpasswordUsecase})
    : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupWhithEmailAndPasswordEvent) {
        emit(SignupLoading());
        final result = await signupUpWhithEmilAndpasswordUsecase.call(
          email: event.email,
          password: event.password,
          name: event.name,
        );
        result.fold(
          (failure) => emit(Signupfailure(error: failure.message)),
          (userentity) => emit(SignupSuccess(user: userentity)),
        );
      }
    });
  }
}
