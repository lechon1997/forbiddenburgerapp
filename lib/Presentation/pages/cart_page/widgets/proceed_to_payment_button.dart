import 'package:flutter/material.dart';

class ProceedToPaymentButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ProceedToPaymentButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Estira al ancho completo
        children: [
          ElevatedButton(
            onPressed: onPressed, // Usa el callback proporcionado
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,

              backgroundColor:
                  const Color(0xffFF6D00), // Color de fondo del botón
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 12,
              ), // Ajuste del padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontFamily: "Cherk",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
