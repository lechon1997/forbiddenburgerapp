import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/cart_page.dart';

class CartButton extends StatelessWidget {
  final int itemCount;

  const CartButton({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Alinear a la derecha
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                color: const Color(0xff212121),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
              ),
              // Contador superpuesto
              Positioned(
                right: 6,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xffFF6D00), // Fondo del contador
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$itemCount',
                    style: const TextStyle(
                        color: Colors.white, // Color del texto
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Cherk"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
