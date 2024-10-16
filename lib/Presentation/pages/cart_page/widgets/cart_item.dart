import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String name;
  final String image;
  final int price;

  const CartItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 90,
                height: 70,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff424242),
                          fontFamily: "cherk",
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      // color: Colors.pink,
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${widget.price}",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff424242)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Editar producto",
                                  style: TextStyle(
                                      fontFamily: "cherk",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff424242)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            //color: Colors.purple,
                            height: 50,
                            child: Align(
                              alignment: Alignment
                                  .bottomRight, // Alinear hacia la parte inferior derecha
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .end, // Alinear hacia la derecha
                                children: [
                                  if (cartCount == 0)
                                    _buildAddButton() // Botón circular pequeño "+"
                                  else
                                    _buildCartControls(), // Controles de cantidad en el carrito
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        /* Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE0E0E0), // Gris suave
                width: 1, // Grosor del borde
              ),
            ),
          ),
        ),*/
        const SizedBox(height: 16)
      ],
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      width: 32, // Ancho del botón circular más pequeño
      height: 32, // Altura del botón circular más pequeño
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(), // Forma circular
          side: const BorderSide(color: Color(0xffBDBDBD)), // Borde gris claro
          padding: EdgeInsets
              .zero, // Quitar el padding para acercar el borde al ícono
        ),
        onPressed: () {
          setState(() {
            cartCount = 1; // Agregar un producto al carrito
          });
        },
        child: const Icon(Icons.add,
            color: Colors.grey, size: 20), // Ícono más pequeño
      ),
    );
  }

  // Controles cuando hay productos en el carrito
  Widget _buildCartControls() {
    return Container(
      height: 32, // Limitar la altura del contenedor para hacerlo más compacto
      padding: const EdgeInsets.symmetric(
          horizontal: 4), // Reducir el padding interno
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffBDBDBD)), // Borde gris
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Evitar que ocupe todo el espacio
        children: [
          IconButton(
            icon: Icon(
              cartCount > 1
                  ? Icons.remove
                  : Icons.delete, // Mostrar "-" o basurero
              color: const Color(0xffD32F2F),
            ),
            padding: EdgeInsets.zero, // Eliminar padding adicional
            constraints: const BoxConstraints(
              minWidth: 28, // Reducir el tamaño del botón
              minHeight: 28,
              maxHeight: 28, // Controlar la altura del botón
              maxWidth: 28,
            ),
            onPressed: () {
              setState(() {
                if (cartCount > 1) {
                  cartCount--; // Restar uno
                } else {
                  cartCount = 0; // Vaciar carrito si llega a 0
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 6), // Espacio entre el número y los iconos
            child: Text(
              '$cartCount', // Mostrar la cantidad en el carrito
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Cherk",
                  fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Color(0xff388E3C),
            ),
            padding: EdgeInsets.zero, // Eliminar padding adicional
            constraints: const BoxConstraints(
              minWidth: 28, // Reducir el tamaño del botón
              minHeight: 28,
              maxHeight: 28, // Controlar la altura del botón
              maxWidth: 28,
            ),
            onPressed: () {
              setState(() {
                cartCount++; // Agregar uno más al carrito
              });
            },
          ),
        ],
      ),
    );
  }
}
