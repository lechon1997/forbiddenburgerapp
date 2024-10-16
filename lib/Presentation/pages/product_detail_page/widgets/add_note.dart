import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final int maxLength;
  final String labelText;

  const AddNote({
    super.key,
    required this.controller,
    required this.focusNode,
    this.maxLength = 100,
    this.labelText = "Agregar una nota:",
  });

  @override
  State<AddNote> createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends State<AddNote> {
  int _charCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
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
              color: Color(0xff424242),
            ),
            controller: widget.controller,
            focusNode: widget.focusNode,
            maxLength: widget.maxLength,
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(6),
              counterText: "$_charCount/${widget.maxLength}",
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
                  color: Colors.grey, // Mantiene el color cuando no está enfocado
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.grey, // Color cuando está enfocado (no cambia)
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
              widget.focusNode.unfocus();
            },
            cursorWidth: 1.0,
            cursorHeight: 18.0,
            cursorColor: Colors.grey,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
