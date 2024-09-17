import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final bool discount;
  final int price;
  final int newPrice;
  final int percent;

  const ProductWidget({
    super.key,
    required this.discount, // Parámtero requerido
    required this.price, // Parámtero requerido
    required this.newPrice, // Parámtero requerido
    required this.percent,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int cartCount = 0; // Estado local para la cantidad en el carrito
  //Recibir por parámetro estas variables

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
                width: 120,
                height: 100,
                child: Image.asset(
                  "assets/images/burger1.png",
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
                    const Text(
                      "Hamburguesa Americana doble",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff424242),
                        height: 1.2,
                      ),
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
                            decoration: TextDecoration
                                .lineThrough, // Agregar línea en el medio
                            decorationColor: Color(
                                0xff212121), // Color de la línea (opcional, usa el mismo que el texto)
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${widget.newPrice}",
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff212121)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${widget.percent}% OFF",
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff388E3C)),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Deliciosa hamburguesa con queso, lechuga, tomate y salsas...",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff757575),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 6),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end, // Ubicar a la derecha
            children: [
              if (cartCount == 0)
                _buildAddButton() // Botón circular pequeño "+"
              else
                _buildCartControls(), // Controles de cantidad en el carrito
            ],
          ),
        ),
        const SizedBox(height: 10), // Separación entre el Row y el borde
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
              color: Colors.red,
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
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.green,
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
