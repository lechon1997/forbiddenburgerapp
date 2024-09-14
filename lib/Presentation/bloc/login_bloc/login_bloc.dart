import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super( const LoginInitialState()) {
    on<LogInUserEvent>((event, emit ) => emit( const LoginSetState(true) ));
    on<LogOutUserEvent>((event, emit ) => emit( const LoginSetState(false) ));
  }

}