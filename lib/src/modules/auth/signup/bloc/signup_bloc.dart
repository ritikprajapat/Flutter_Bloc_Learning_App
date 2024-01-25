import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupInitial> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupUserNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });
    on<SignupEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<SignupPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<SignupConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
    on<SignupPasswordVisibleEvent>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
    on<SignupConfirmPasswordVisibleEvent>((event, emit) {
      emit(state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
    });
  }
}
