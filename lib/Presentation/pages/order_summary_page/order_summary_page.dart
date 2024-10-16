import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/order_summary_page/widgets/pickupOrDeliveryOption.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF6D00),
      ),
      body: Column(
        children: [PickupOrDeliveryOption()],
      ),
    );
  }
}
