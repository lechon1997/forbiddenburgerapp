import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/special_discounts_widget.dart';

class SpecialDiscountsContainer extends StatelessWidget {
  const SpecialDiscountsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Descuentos",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff424242)),
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialDiscountsWidget(
                discount: false,
                newPrice: 190,
                price: 210,
                percent: 12,
              ),
              SpecialDiscountsWidget(
                discount: false,
                newPrice: 190,
                price: 210,
                percent: 12,
              ),
              SpecialDiscountsWidget(
                discount: false,
                newPrice: 190,
                price: 210,
                percent: 12,
              )
            ],
          ),
        )
      ],
    );
  }
}
