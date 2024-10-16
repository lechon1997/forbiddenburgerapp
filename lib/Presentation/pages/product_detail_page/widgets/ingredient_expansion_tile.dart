import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Domain/entities/ingredientModel.dart';

class IngredientExpansionTile extends StatefulWidget {
  final String title;
  final Map<String, IngredientModel> ingredients;
  final ValueChanged<String> onChanged;
  final bool isExpanded;

  const IngredientExpansionTile({
    super.key,
    required this.title,
    required this.ingredients,
    required this.onChanged,
    this.isExpanded = false,
  });

  @override
  State<IngredientExpansionTile> createState() => _IngredientExpansionTileState();
}

class _IngredientExpansionTileState extends State<IngredientExpansionTile> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: "Cherk",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff212121),
                ),
              ),
              trailing: Icon(
                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              children: widget.ingredients.values.map((ingredient) {
                return Column(
                  children: [
                    CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              ingredient.nombre,
                              style: const TextStyle(
                                fontFamily: "Cherk",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (ingredient.precio != null) // Mostrar el precio solo si no es null
                            Text(
                              "+\$${ingredient.precio?.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontFamily: "Cherk",
                                color: Color(0xff424242),
                                fontSize: 15,
                              ),
                            ),
                        ],
                      ),
                      value: ingredient.isSelected, // Usar isSelected para controlar el estado
                      onChanged: (bool? value) {
                        setState(() {
                          ingredient.isSelected = value ?? false; // Actualizar el estado
                          widget.onChanged(ingredient.nombre); // Notificar al padre
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                      visualDensity: VisualDensity.compact,
                    ),
                    const Divider(), // Línea divisoria
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
