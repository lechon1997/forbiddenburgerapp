import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_event.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.red,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sesión activa',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LogOutUserEvent());
            },
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    ),
    );
  }


}
