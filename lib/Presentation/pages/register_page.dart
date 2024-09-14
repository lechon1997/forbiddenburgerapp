import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:forbiddenburgerapp/Presentation/pages/confirm_email_page.dart';
// Puedes agregar aquí el paquete para validación de números si decides usar uno

void pickerCountryCode({
  required BuildContext context,
  required void Function(Country) onSelect,
}) =>
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: onSelect,
    );

class PickCountryCode {
  final String phoneCode;
  final String flagEmoji;
  
  PickCountryCode({
    required this.phoneCode,
    required this.flagEmoji,
  });

  PickCountryCode copyWith({
    String? phoneCode,
    String? flagEmoji,
  }) {
    return PickCountryCode(
      phoneCode: phoneCode ?? this.phoneCode,
      flagEmoji: flagEmoji ?? this.flagEmoji,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneCode': phoneCode,
      'flagEmoji': flagEmoji,
    };
  }

  factory PickCountryCode.fromMap(Map<String, dynamic> map) {
    return PickCountryCode(
      phoneCode: map['phoneCode'] as String,
      flagEmoji: map['flagEmoji'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  PickCountryCode _selectedCountryCode = PickCountryCode(phoneCode: '+598', flagEmoji: '🇺🇾');
  String _phoneNumber = '';
  String? _phoneNumberError;

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
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30),
    );

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
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              child: const Text(
                "Introduce un correo electrónico y contraseña para crear su cuenta.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF616161),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                        _validatePhoneNumber(value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      label: Text('12312*******'),
                      counterText: '',
                      border: const OutlineInputBorder(),
                      prefixIcon: _countryCodeButtom(context: context),
                      errorText: _phoneNumberError,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
                obscureText: _isPasswordObscured,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  ),
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                ),
                style: const TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: _isConfirmPasswordObscured,
                decoration: InputDecoration(
                  labelText: "Confirmar contraseña",
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                  labelStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
                ),
                style: const TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => ConfirmEmailPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(position: offsetAnimation, child: child);
                    },
                    transitionDuration: const Duration(milliseconds: 700),
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
          ],
        ),
      ),
    );
  }

  Widget _countryCodeButtom({required BuildContext context}) {
    return TextButton(
      child: Text('${_selectedCountryCode.flagEmoji} ${_selectedCountryCode.phoneCode}'),
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
