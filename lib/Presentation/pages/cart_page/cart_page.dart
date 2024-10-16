import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/cart_item.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/proceed_to_payment_button.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/sub_total_order.dart';
import 'package:forbiddenburgerapp/Presentation/pages/order_summary_page/order_summary_page.dart';
import 'package:forbiddenburgerapp/Presentation/pages/order_summary_page/widgets/pickupOrDeliveryOption.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6D00),
      ),
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xffE5E5E5),
                child: Column(
                  children: [
                    const PickupOrDeliveryOption(),
                    const SizedBox(height: 5),
                    Container(
                      color: Colors.white,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            child: Text(
                              "Tus productos",
                              style: TextStyle(
                                  fontFamily: "cherk",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 18),
                          CartItem(
                            name:
                                "Hamburguesa Americana doble bien calentitas a la parrila",
                            image: "assets/images/burger1.png",
                            price: 230,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Este es el contenedor que debería ocupar el resto del espacio
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          const Text(
                            "Resumen",
                            style: TextStyle(
                                fontFamily: "cherk",
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Productos",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: "cherk"),
                              ),
                              Text("\$230",
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: "cherk"))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Envío",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: "cherk"),
                              ),
                              Text("\$15",
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: "cherk"))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFE0E0E0), // Gris suave
                                  width: 1, // Grosor del borde
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "cherk",
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("\$245",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "cherk",
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
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
                // Total y cantidad
                const SubTotalOrder(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 16),
                    Flexible(
                      child: ProceedToPaymentButton(
                        buttonText: 'Proceder a pagar',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderSummaryPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
