import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_state.dart';
import 'package:forbiddenburgerapp/Presentation/pages/login_page.dart';
import 'package:forbiddenburgerapp/Presentation/pages/profile_page.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.loggedInUser) {
          return const ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
