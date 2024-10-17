import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/cart_items_list.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/payment_summary.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/proceed_to_payment_button.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/sub_total_order.dart';
import 'package:forbiddenburgerapp/Presentation/pages/cart_page/widgets/suggested_products.dart';
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
                child: const Column(
                  children: [
                    PickupOrDeliveryOption(),
                    SizedBox(height: 5),
                    CartItemsList(),
                    SizedBox(height: 5),
                    SuggestedProducts(),
                    SizedBox(height: 5),
                    PaymentSummary()
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProceedToPaymentButton(
                buttonText: 'Proceder a pagar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderSummaryPage()),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
