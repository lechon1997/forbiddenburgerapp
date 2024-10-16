import 'package:flutter/material.dart';

class ProductInfoCard extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final int price;

  const ProductInfoCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double availableHeight = MediaQuery.of(context).size.height * 0.3;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: screenWidth,
            height: availableHeight,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: "Cherk",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: "Cherk",
                    fontSize: 14,
                    color: Color(0xff616161),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "\$$price",
                  style: const TextStyle(
                    fontFamily: "Cherk",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
