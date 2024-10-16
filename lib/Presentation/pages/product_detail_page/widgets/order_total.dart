import 'package:flutter/material.dart';

class OrderTotal extends StatelessWidget {
  const OrderTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Cherk",
          ),
        ),
        Text(
          "\$120", // Ajusta este valor dinámicamente si es necesario
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Cherk",
            color: Color(0xff212121),
          ),
        ),
      ],
    );
  }
}
