class IngredientModel {
  final String nombre;
  final double? precio;
  bool isSelected;

  IngredientModel({
    required this.nombre,
    this.precio,
    this.isSelected = false,
  });
}
