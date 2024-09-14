import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_event.dart';
import 'package:forbiddenburgerapp/Presentation/pages/register_page.dart';

class LoginScreen extends StatelessWidget {
  final String user;
  final String password;
  
  const LoginScreen({super.key, this.user = "leo", this.password = "1234"});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController correoController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30),
    );

    void login() {
      String inputUser = correoController.text;
      String inputPassword = passwordController.text;
       
      if (inputUser == user && inputPassword == password) {
        BlocProvider.of<LoginBloc>(context).add(LogInUserEvent());
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Usuario o contraseña incorrectos."),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true, // Allows the content to adjust when the keyboard appears
      body: SingleChildScrollView( // Makes the content scrollable
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/images/p13.png",
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: size.height * 0.01),
                ClipOval(
                  child: SizedBox(
                    height: 130.0,
                    width: 130.0,
                    child: Image.asset(
                      'assets/images/p8.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: GestureDetector(
                    onTap: () => {},
                    child: const Text(
                      "!Obtén grandes descuentos y puntos por cada compra!",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: correoController,
                    decoration: InputDecoration(
                      labelText: "Correo electrónico",
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                      labelStyle: TextStyle(color: Colors.grey[700])
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        filled: true,
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                        labelStyle: TextStyle(color: Colors.grey[700])
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1976D2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    onPressed: login,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        color: Colors.orange[700],
                      ),
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        "Iniciar sesión",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const RegisterPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        var begin = const Offset(1.0, 0.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(position: offsetAnimation, child: child);
                      },
                      transitionDuration: const Duration(milliseconds: 700),
                    ))
                    },
                    child: const Text(
                      "¿No tienes una cuenta? Registrate",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1976D2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
