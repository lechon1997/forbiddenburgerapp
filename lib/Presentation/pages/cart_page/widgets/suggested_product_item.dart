import 'package:flutter/material.dart';

class SuggestedProductItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final VoidCallback onAddToCart;

  const SuggestedProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 180,
          padding: const EdgeInsets.symmetric(vertical: 8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade300, // Línea gris claro
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                image,
                width: 90,
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: "cherk",
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Positioned(
          right: 14,
          top: 14,
          child: GestureDetector(
            onTap: onAddToCart,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Círculo gris claro
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 16,
          child: Text(
            "\$$price",
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "cherk",
            ),
          ),
        ),
      ],
    );
  }
}
