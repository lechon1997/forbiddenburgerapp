import 'package:flutter/material.dart';

class PickupOrDeliveryOption extends StatefulWidget {
  const PickupOrDeliveryOption({super.key});

  @override
  State<PickupOrDeliveryOption> createState() => _PickupOrDeliveryOptionState();
}

class _PickupOrDeliveryOptionState extends State<PickupOrDeliveryOption> {
  String _selectedOption = "Delivery";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              "¿Cómo deseas recibir tu pedido?",
              style: TextStyle(
                  fontFamily: "cherk",
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xffEEEEEE),
              ),
              child: Wrap(
                spacing: 4,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = "Delivery";
                      });
                    },
                    child: Container(
                      width: 140,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: _selectedOption == "Delivery"
                            ? Colors.black
                            : const Color(0xffEEEEEE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delivery_dining_outlined,
                              color: _selectedOption == "Delivery"
                                  ? Colors.white
                                  : Colors.black,
                              size: 20),
                          const SizedBox(width: 6),
                          Text(
                            "Delivery",
                            style: TextStyle(
                              color: _selectedOption == "Delivery"
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "cherk",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = "Retiro";
                      });
                    },
                    child: Container(
                      width: 140,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: _selectedOption == "Retiro"
                            ? Colors.black
                            : const Color(0xffEEEEEE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_mall_outlined,
                              color: _selectedOption == "Retiro"
                                  ? Colors.white
                                  : Colors.black,
                              size: 20),
                          const SizedBox(
                              width: 6), // Espacio entre el ícono y el texto
                          Text(
                            "Retiro",
                            style: TextStyle(
                              color: _selectedOption == "Retiro"
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "cherk",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ));
  }
}
