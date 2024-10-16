import 'package:flutter/material.dart';

class SubTotalOrder extends StatelessWidget {
  const SubTotalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subtotal",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Cherk",
              color: Color(0xff212121)),
        ),
        Text(
          "\$140",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Cherk",
            color: Color(0xff212121),
          ),
        ),
      ],
    );
  }
}
