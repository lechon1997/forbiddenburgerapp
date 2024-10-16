import 'package:flutter/material.dart';

class SelectQuantity extends StatefulWidget {
  const SelectQuantity({super.key});

  @override
  State<StatefulWidget> createState() => _SelectQuantity();
}

class _SelectQuantity extends State<SelectQuantity> {
  int cantidad = 1;

  void _incrementarCantidad() {
    setState(() {
      cantidad++;
    });
  }

  void _decrementarCantidad() {
    if (cantidad > 1) {
      setState(() {
        cantidad--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Usar Material para los IconButton para evitar conflictos con ParentDataWidget
          Material(
            child: IconButton(
              icon: Icon(
                Icons.remove,
                color: cantidad > 1 ? Colors.black : Colors.grey,
              ),
              onPressed: _decrementarCantidad,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 40,
            child: Text(
              '$cantidad',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Cherk",
              ),
            ),
          ),
          Material(
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: _incrementarCantidad,
            ),
          ),
        ],
      ),
    );
  }
}
