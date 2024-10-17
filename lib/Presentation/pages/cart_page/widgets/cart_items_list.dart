import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              "Tus productos",
              style: TextStyle(
                fontFamily: "cherk",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 18),
          CartItem(
            name: "Hamburguesa Americana doble bien calentitas a la parrila",
            image: "assets/images/burger1.png",
            price: 230,
          ),
          CartItem(
            name: "Hamburguesa Americana doble bien calentitas a la parrila",
            image: "assets/images/burger1.png",
            price: 230,
          ),
          CartItem(
            name: "Hamburguesa Americana doble bien calentitas a la parrila",
            image: "assets/images/burger1.png",
            price: 230,
          ),
        ],
      ),
    );
  }
}
