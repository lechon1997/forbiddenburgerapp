import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/landing_page.dart';

class ConfirmEmailPage extends StatelessWidget {
  ConfirmEmailPage({super.key});
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

@override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Scaffold(
    resizeToAvoidBottomInset: true,
     appBar: AppBar(
        backgroundColor: const Color(0xFFFF6D00),
        toolbarHeight: 44.0,
      ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset(
                  "assets/images/p11.png",
                  width: size.width,
                  fit: BoxFit.cover,
          ),
          SizedBox(height: size.height * 0.03),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                "Confirmar correo electrónico",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF616161),
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
          ),
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: const Text(
                "Ingresa el código de confirmación que enviamos a odriozolaleo1@gmail.com",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9E9E9E),
                ),
                textAlign: TextAlign.left,
              ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPinCodeTextField(context, controller1, focusNode1, focusNode2),
              _buildPinCodeTextField(context, controller2, focusNode2, focusNode3),
              _buildPinCodeTextField(context, controller3, focusNode3, focusNode4),
              _buildPinCodeTextField(context, controller4, focusNode4, null),
            ],
          ),
          SizedBox(height: size.height * 0.035),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                "¿No recibiste ningún código?",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9E9E9E),
                ),
                textAlign: TextAlign.center,
              ),
          ),
          SizedBox(height: size.height * 0.005),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
                "Reenviar código",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF0091EA),
                ),
                textAlign: TextAlign.center,
                
              ),
          ),
          SizedBox(height: size.height * 0.1),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              onPressed: () {
               Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
                ModalRoute.withName('/'), // Especifica la ruta raíz o cualquier otra ruta que deseas mantener
              );
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
                  color: Colors.orange[700],
                ),
                padding: const EdgeInsets.all(0),
                child: const Text(
                  "Confirmar código",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _buildPinCodeTextField(BuildContext context, TextEditingController controller, FocusNode currentFocus, FocusNode? nextFocus) {
  return SizedBox(
    width: 64,
    height: 80,
    child: Center(
      child: TextField(
      controller: controller,
      focusNode: currentFocus,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 1,
      decoration: InputDecoration(
        counterText: "",  // Hide the counter text below the TextField
        contentPadding: const EdgeInsets.symmetric(vertical: 25.0), // Ajusta esto para centrar verticalmente el texto
        enabledBorder:  UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
          borderRadius: BorderRadius.circular(14)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
          borderRadius: BorderRadius.circular(14), // Ajusta el radio del borde aquí
        ),
        border: OutlineInputBorder(  // Define el borde general para mantener la consistencia
          borderRadius: BorderRadius.circular(14),
        ),
        fillColor: const Color(0xFFEEEEEE),
        filled: true
      ),
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      onChanged: (value) {
        if (value.length == 1 && nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
    ),
    ) ,
  );
}
}
