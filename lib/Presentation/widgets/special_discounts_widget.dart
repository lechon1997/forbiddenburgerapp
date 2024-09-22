import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page.dart';

class SpecialDiscountsWidget extends StatefulWidget {
  final String image;
  final String description;
  final String name;
  final bool discount;
  final int price;
  final int newPrice;
  final int percent;

  const SpecialDiscountsWidget({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.discount,
    required this.price,
    required this.newPrice,
    required this.percent,
  });

  @override
  State<SpecialDiscountsWidget> createState() => _SpecialDiscountsState();
}

class _SpecialDiscountsState extends State<SpecialDiscountsWidget> {
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega a la pantalla de detalles del producto
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              name: widget.name,
              description: widget.description,
              price: widget.price,
              image: "assets/images/burger1.png",
            ),
          ),
        );
      },
      child: Container(
        width: 340,
        height: 115,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 100,
                    height: 80,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff424242),
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${widget.price}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff757575),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Color(0xff212121),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  "\$${widget.newPrice}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff212121)),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${widget.percent}% OFF",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff388E3C)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
