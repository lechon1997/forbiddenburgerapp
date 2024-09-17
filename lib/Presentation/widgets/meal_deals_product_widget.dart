import 'package:flutter/material.dart';

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
    return Container(
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
              ),
              const SizedBox(height: 6),
              Container(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      8), // Bordes redondeados en la imagen
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    height: 150,
                    // Ajusta el ancho para llenar el contenedor
                  ),
                ),
              ),
              const SizedBox(height: 10), // Espacio entre la imagen y el nombre
              // Espacio entre el nombre y la descripción

              // Descripción del producto con límite de caracteres
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff757575),
                ),
                maxLines: 2, // Limitar a dos líneas
                overflow: TextOverflow
                    .ellipsis, // Agregar "..." si se excede el límite
              ),
            ],
          ),
          // Precio del producto posicionado en la esquina inferior izquierda
          Positioned(
            bottom: 0, // Distancia desde abajo
            left: 0, // Distancia desde la izquierda
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
    );
  }
}
