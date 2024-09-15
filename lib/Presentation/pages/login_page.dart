import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_event.dart';
import 'package:forbiddenburgerapp/Presentation/pages/register_page.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/country_code_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String user = "leo";
  final String password = "1234";
  bool _isPasswordObscured = true;
  PickCountryCode _selectedCountryCode =
      PickCountryCode(phoneCode: '+598', flagEmoji: '🇺🇾');
  String _phoneNumber = '';
  String? _phoneNumberError;

  void _validatePhoneNumber(String number) {
    if (number.length < 10) {
      setState(() {
        _phoneNumberError = 'Número de teléfono no válido';
      });
    } else {
      setState(() {
        _phoneNumberError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController correoController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    FocusNode focusNode = FocusNode();
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
      resizeToAvoidBottomInset:
          true, // Allows the content to adjust when the keyboard appears
      body: SingleChildScrollView(
        // Makes the content scrollable
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              SizedBox(height: size.height * 0.01),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Color de la sombra
                      spreadRadius: 2, // Expansión de la sombra
                      blurRadius: 10, // Suavidad de la sombra
                      offset:
                          const Offset(0, 3), // Posición de la sombra (x, y)
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.01),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Teléfono",
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xff9E9E9E))),
                            Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: IntlPhoneField(
                                  focusNode: focusNode,
                                  disableLengthCheck: true,
                                  style: const TextStyle(
                                    color: Color(
                                        0xff616161), // Cambia el color del texto ingresado
                                    fontSize:
                                        15, // También puedes ajustar el tamaño de la fuente
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        color: const Color(0xFF9E9E9E),
                                        icon: const Icon(Icons.phone),
                                        onPressed: () {}),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(
                                              0xFFE0E0E0)), // Color del borde cuando no está enfocado
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(
                                              0xFFBDBDBD)), // Color del borde cuando está enfocado
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    contentPadding:
                                        const EdgeInsets.only(bottom: 9),
                                    hintText: '091 234 567',
                                    labelText: '',
                                    hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    labelStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  languageCode: "es",
                                  initialCountryCode: "UY",
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                  onCountryChanged: (country) {
                                    print(
                                        'Country changed to: ' + country.name);
                                  },
                                ))
                          ],
                        )),
                    SizedBox(height: size.height * 0.035),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text("Contraseña",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff9E9E9E))),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: TextField(
                                controller: passwordController,
                                obscureText: _isPasswordObscured,
                                style: const TextStyle(
                                  color: Color(
                                      0xff616161), // Cambia el color del texto ingresado
                                  fontSize:
                                      15, // También puedes ajustar el tamaño de la fuente
                                ),
                                decoration: InputDecoration(
                                  labelText: "",
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  labelStyle: const TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(
                                            0xFFE0E0E0)), // Color del borde cuando no está enfocado
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(
                                            0xFFBDBDBD)), // Color del borde cuando está enfocado
                                  ),
                                  suffixIcon: IconButton(
                                    color: const Color(0xFF9E9E9E),
                                    icon: Icon(
                                      _isPasswordObscured
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordObscured =
                                            !_isPasswordObscured;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      child: const Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          fontSize: 13,
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
                            color: const Color(0xffFF6D00),
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
                    SizedBox(height: size.height * 0.05),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const RegisterPage(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = const Offset(1.0, 0.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                      position: offsetAnimation, child: child);
                                },
                                transitionDuration:
                                    const Duration(milliseconds: 700),
                              ))
                        },
                        child: const Text(
                          "¿No tienes una cuenta? Registrate",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF1976D2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _countryCodeButtom({required BuildContext context}) {
    return TextButton(
      child: Text(
          '${_selectedCountryCode.flagEmoji} ${_selectedCountryCode.phoneCode}'),
      onPressed: () => pickerCountryCode(
        context: context,
        onSelect: (code) {
          setState(() {
            _selectedCountryCode = PickCountryCode(
              phoneCode: code.phoneCode,
              flagEmoji: code.flagEmoji,
            );
          });
        },
      ),
    );
  }
}
