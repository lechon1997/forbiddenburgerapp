import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/confirm_phone_page.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/country_code_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// Puedes agregar aquí el paquete para validación de números si decides usar uno

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  PickCountryCode _selectedCountryCode =
      PickCountryCode(phoneCode: '+598', flagEmoji: '🇺🇾');
  String _phoneNumber = '';
  String? _phoneNumberError;

  FocusNode focusNode = FocusNode();
  void _validatePhoneNumber(String number) {
    // Aquí puedes usar una librería de validación de números si decides agregar una
    // Ejemplo simple de validación basada en longitud (ajusta según tus necesidades)
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6D00),
        toolbarHeight: 44.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/images/p11.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
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
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: const Text(
                "Introduce un teléfono y contraseña para crear su cuenta.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF616161),
                ),
                textAlign: TextAlign.center,
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
                child: Column(children: <Widget>[
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
                              height: 36,
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
                                      const EdgeInsets.only(bottom: 8),
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
                                  print('Country changed to: ' + country.name);
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
                          height: 36,
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
                                  color: const Color(0Xff9E9E9E),
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
                  SizedBox(height: size.height * 0.035),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text("Confirmar contraseña",
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff9E9E9E))),
                        Container(
                          height: 36,
                          alignment: Alignment.center,
                          child: SizedBox(
                            child: TextField(
                              controller: confirmPasswordController,
                              obscureText: _isConfirmPasswordObscured,
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
                                  color: const Color(0Xff9E9E9E),
                                  icon: Icon(
                                    _isConfirmPasswordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordObscured =
                                          !_isConfirmPasswordObscured;
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
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  ConfirmPhonePage(),
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
                            ));
                      },
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
                          color: const Color(0xFFFF6D00),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "Registrarse",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                ]))
          ],
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
