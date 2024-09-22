import 'package:flutter/material.dart';

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
  // Estados para los ingredientes a quitar
  bool cebolla = false;
  bool lechuga = false;
  bool tomate = false;
  bool pickle = false;

  // Estados para los ingredientes a agregar
  bool extraQueso = false;
  bool huevo = false;
  bool salsaBigMac = false;

  // Estado para controlar si los ExpansionTiles están expandidos
  bool isExpandedQuitar = false;
  bool isExpandedAgregar = false;
  final FocusNode _focusNode =
      FocusNode(); // FocusNode para controlar el enfoque
  final TextEditingController _controller = TextEditingController();
  int _charCount = 0;
  @override
  void dispose() {
    _controller.dispose();
    _focusNode
        .dispose(); // Asegurar que el FocusNode se libere cuando no se necesite más
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double availableHeight =
        screenHeight - kToolbarHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Container(
              color: const Color(0xffE0E0E0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth,
                          height: availableHeight * 0.3,
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontFamily: "Cherk",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff212121),
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                widget.description,
                                style: const TextStyle(
                                  fontFamily: "Cherk",
                                  fontSize: 14,
                                  color: Color(0xff616161),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "\$${widget.price}",
                                style: const TextStyle(
                                  fontFamily: "Cherk",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff212121),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  // ExpansionTile para quitar ingredientes
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor:
                                Colors.transparent, // Eliminar el borde
                          ),
                          child: ExpansionTile(
                            title: const Text(
                              "Quitar algún ingrediente:",
                              style: TextStyle(
                                fontFamily: "Cherk",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff212121),
                              ),
                            ),
                            trailing: Icon(
                              isExpandedQuitar
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                isExpandedQuitar = expanded;
                              });
                            },
                            children: [
                              // Aquí van los checkbox
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CheckboxListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        title: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text("Cebolla",
                                                style: TextStyle(
                                                    fontFamily: "Cherk",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        value: cebolla,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            cebolla = value ?? false;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        visualDensity: VisualDensity.compact),
                                    const Divider(), // Línea divisoria
                                    CheckboxListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        title: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            child: Text("Lechuga",
                                                style: TextStyle(
                                                    fontFamily: "Cherk",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        value: lechuga,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            lechuga = value ?? false;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        visualDensity: VisualDensity.compact),
                                    const Divider(),
                                    CheckboxListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        title: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text("Tomate",
                                                style: TextStyle(
                                                    fontFamily: "Cherk",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        value: tomate,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            tomate = value ?? false;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        visualDensity: VisualDensity.compact),
                                    const Divider(), // Línea divisoria
                                    CheckboxListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        title: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text("Pickle",
                                                style: TextStyle(
                                                    fontFamily: "Cherk",
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        value: pickle,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            pickle = value ?? false;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        visualDensity: VisualDensity.compact),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  // ExpansionTile para agregar ingredientes
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            dividerColor:
                                Colors.transparent, // Eliminar el borde
                          ),
                          child: ExpansionTile(
                            title: const Text(
                              "Agregar ingredientes:",
                              style: TextStyle(
                                fontFamily: "Cherk",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff212121),
                              ),
                            ),
                            trailing: Icon(
                              isExpandedAgregar
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                isExpandedAgregar = expanded;
                              });
                            },
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 38,
                                      child: CheckboxListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        title: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                "Extra queso",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Cherk",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text("+\$20",
                                                style: TextStyle(
                                                    fontFamily: "Cherk",
                                                    color: Color(0xff424242),
                                                    fontSize: 15)),
                                          ],
                                        ),
                                        value: extraQueso,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            extraQueso = value ?? false;
                                          });
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        visualDensity: VisualDensity.compact,
                                      ),
                                    ),
                                    const Divider(), // Línea divisoria
                                    SizedBox(
                                        height: 38,
                                        child: CheckboxListTile(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          title: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Text(
                                                  "Huevo",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: "Cherk",
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text("+\$20",
                                                  style: TextStyle(
                                                      fontFamily: "Cherk",
                                                      color: Color(0xff424242),
                                                      fontSize: 15)),
                                            ],
                                          ),
                                          value: huevo,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              huevo = value ?? false;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          visualDensity: VisualDensity.compact,
                                        )),
                                    const Divider(), // Línea divisoria
                                    SizedBox(
                                        height: 38,
                                        child: CheckboxListTile(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          title: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Text(
                                                  "Salsa BigMac",
                                                  style: TextStyle(
                                                      fontFamily: "Cherk",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                "+\$20",
                                                style: TextStyle(
                                                    fontFamily: "Cherk",
                                                    color: Color(0xff424242),
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          value: salsaBigMac,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              salsaBigMac = value ?? false;
                                            });
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          visualDensity: VisualDensity.compact,
                                        )),
                                    const SizedBox(height: 16)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Text area aqui:
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Agregar una nota:",
                          style: TextStyle(
                            fontFamily: "Cherk",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff212121),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          style: const TextStyle(
                              fontFamily: "Cherk",
                              fontSize: 14,
                              color: Color(0xff424242)),
                          controller: _controller,
                          focusNode: _focusNode,
                          maxLength: 100,
                          maxLines: 3,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(6),
                            counterText: "$_charCount/100",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.grey, // Color del borde
                                width: 1.0, // Borde fino
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors
                                    .grey, // Mantiene el color cuando no está enfocado
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors
                                    .grey, // Color cuando está enfocado (no cambia)
                                width: 1.0,
                              ),
                            ),
                          ),
                          onChanged: (text) {
                            setState(() {
                              _charCount = text.length;
                            });
                          },
                          onSubmitted: (value) {
                            // Cuando el usuario presione Enter o Done, quita el foco
                            _focusNode.unfocus();
                          },
                          cursorWidth: 1.0, // Ajusta el grosor del cursor
                          cursorHeight: 18.0, // Ajusta la altura del cursor
                          cursorColor: Colors.grey,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
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
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Estirar al ancho completo
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Espacio entre el texto y el precio
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cherk",
                        ),
                      ),
                      Text(
                        "\$120",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cherk",
                          color: Color(0xff212121),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Espacio entre el total y el botón
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Producto añadido al carrito"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color(0xff388E3C), // Color de fondo del botón
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 16,
                      ), // Ajuste del padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Añadir al carrito',
                      style: TextStyle(
                        fontFamily: "Cherk",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
