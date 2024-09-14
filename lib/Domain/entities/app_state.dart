class AppState {
  final bool isLoggedIn;

  AppState({this.isLoggedIn = false});

  AppState copyWith({bool? isLoggedIn}) {
    return AppState(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }
}