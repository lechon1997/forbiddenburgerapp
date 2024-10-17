import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Text(
            "Resumen",
            style: TextStyle(
              fontFamily: "cherk",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Productos",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "cherk",
                ),
              ),
              Text(
                "\$230",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "cherk",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Envío",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "cherk",
                ),
              ),
              Text(
                "\$15",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "cherk",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFE0E0E0), // Gris suave
                  width: 1, // Grosor del borde
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "cherk",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "\$245",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "cherk",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
