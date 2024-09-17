import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/meal_deals_product_widget.dart';

class MealDealdsWidget extends StatelessWidget {
  const MealDealdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Combos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff424242),
            ),
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MealDealsProductWidget(
                image: "assets/images/burger1.png",
                name: "Doble burger americana",
                description:
                    "doble carne de 100 gramos, doble queso cheddar, doble tomate, 1 feta de jamón, y mayonesa",
                price: 500,
              ),
              MealDealsProductWidget(
                image: "assets/images/burger1.png",
                name: "Burger con queso",
                description: "la deliciosa con extra queso",
                price: 550,
              ),
              MealDealsProductWidget(
                image: "assets/images/burger1.png",
                name: "Triple bacon",
                description: "la mejor para los amantes del bacon",
                price: 600,
              ),
            ],
          ),
        )
      ],
    );
  }
}
