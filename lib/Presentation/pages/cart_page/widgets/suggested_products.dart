import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/suggested_product_item.dart';

class SuggestedProducts extends StatelessWidget {
  const SuggestedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(
              "También te puede interesar",
              style: TextStyle(
                fontFamily: "cherk",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Producto 1
                  SuggestedProductItem(
                    name: "Forbidden Burger 2 triple",
                    image: "assets/images/burger1.png",
                    price: 120,
                    onAddToCart: () {
                      // Acción al añadir al carrito
                    },
                  ),
                  // Producto 2
                  SuggestedProductItem(
                    name: "Nuggets",
                    image: "assets/images/burger1.png",
                    price: 140,
                    onAddToCart: () {
                      // Acción al añadir al carrito
                    },
                  ),
                  // Producto 3
                  SuggestedProductItem(
                    name: "Aros de Cebolla",
                    image: "assets/images/burger1.png",
                    price: 130,
                    onAddToCart: () {
                      // Acción al añadir al carrito
                    },
                  ),
                  SuggestedProductItem(
                    name: "Aros de Cebolla",
                    image: "assets/images/burger1.png",
                    price: 130,
                    onAddToCart: () {
                      // Acción al añadir al carrito
                    },
                  )
                ],
              )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
