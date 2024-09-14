abstract class LoginEvent {}

class LogInUserEvent extends LoginEvent { LogInUserEvent(); }
class LogOutUserEvent extends LoginEvent { LogOutUserEvent(); }