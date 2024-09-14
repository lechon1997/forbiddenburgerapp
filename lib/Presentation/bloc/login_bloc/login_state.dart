
abstract class LoginState {
   final bool loggedInUser;
 
   const LoginState({
    this.loggedInUser = true
   });

}

class LoginInitialState extends LoginState {
  const LoginInitialState() : super( loggedInUser: true);
}

class LoginSetState extends LoginState {
  final bool newLoggedInUser;
  const LoginSetState(this.newLoggedInUser) : super(loggedInUser: newLoggedInUser);
}
