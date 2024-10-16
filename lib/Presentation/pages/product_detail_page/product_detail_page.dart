import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Domain/entities/ingredientModel.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page/widgets/add_note.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page/widgets/add_to_cart_button.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page/widgets/ingredient_expansion_tile.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page/widgets/order_total.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page/widgets/product_info_card.dart';
import 'package:forbiddenburgerapp/Presentation/pages/product_detail_page/widgets/select_quantity.dart';

class ProductDetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final int price;

  const ProductDetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _noteFocusNode = FocusNode();

  Map<String, IngredientModel> ingredientesAQuitar = {
    "Cebolla": IngredientModel(nombre: "Cebolla"),
    "Lechuga": IngredientModel(nombre: "Lechuga"),
    "Tomate": IngredientModel(nombre: "Tomate"),
    "Pickle": IngredientModel(nombre: "Pickle"),
  };

  Map<String, IngredientModel> ingredientesAAgregar = {
    "Extra queso": IngredientModel(nombre: "Extra queso", precio: 20.0),
    "Huevo": IngredientModel(nombre: "Huevo", precio: 20.0),
    "Salsa BigMac": IngredientModel(nombre: "Salsa BigMac", precio: 20.0),
  };

  void _onIngredientChanged(String ingredient) {
    setState(() {
      // Lógica adicional si es necesario
    });
  }

  @override
  void dispose() {
    _noteController.dispose();
    _noteFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          // Contenido que puede hacer scroll
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xffE5E5E5),
                child: Column(
                  children: [
                    ProductInfoCard(
                      image: widget.image,
                      name: widget.name,
                      description: widget.description,
                      price: widget.price,
                    ),
                    const SizedBox(height: 5),
                    IngredientExpansionTile(
                      title: 'Quitar algún ingrediente:',
                      ingredients: ingredientesAQuitar,
                      onChanged: _onIngredientChanged,
                    ),
                    const SizedBox(height: 5),
                    IngredientExpansionTile(
                      title: 'Agregar ingredientes:',
                      ingredients: ingredientesAAgregar,
                      onChanged: _onIngredientChanged,
                    ),
                    const SizedBox(height: 5),
                    AddNote(
                      controller: _noteController,
                      focusNode: _noteFocusNode,
                      maxLength: 100,
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ),
            ),
          ),

          // Botón fijo en la parte inferior con selector de cantidad y total
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
                const OrderTotal(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SelectQuantity(),
                    const SizedBox(width: 16),
                    Flexible(
                      child: AddToCartButton(
                        buttonText: 'Añadir al carrito',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Producto añadido al carrito"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
