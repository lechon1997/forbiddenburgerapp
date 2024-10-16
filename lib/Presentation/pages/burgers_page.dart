import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/product_widget.dart';

class BurgersPage extends StatelessWidget {
  const BurgersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6D00),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Column(
            children: [
              SizedBox(height: 22),
              ProductWidget(
                discount: false,
                newPrice: 190,
                price: 210,
                percent: 12,
              ),
              ProductWidget(
                discount: false,
                newPrice: 190,
                price: 210,
                percent: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
