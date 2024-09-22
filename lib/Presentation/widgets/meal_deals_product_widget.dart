import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page.dart';

class MealDealsProductWidget extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final int price;

  const MealDealsProductWidget({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  State<StatefulWidget> createState() => _MealDealsProductState();
}

class _MealDealsProductState extends State<MealDealsProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                image: widget.image,
                name: widget.name,
                description: widget.description,
                price: widget.price,
              ),
            ),
          );
        },
        child: Container(
          width: 250,
          height: 280,
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
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: Color(0xff424242)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff757575),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(
                  "\$${widget.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff212121),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
