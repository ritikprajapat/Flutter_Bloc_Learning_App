import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginInitial> {
  LoginBloc() : super(LoginInitial()) {
    on<EmailEvent>((event, emit) {
      log('Email ${event.email}');
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      log('Password ${event.password}');

      emit(state.copyWith(password: event.password));
    });
  }
}
