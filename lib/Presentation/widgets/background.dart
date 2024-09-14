import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height, // Ensuring this occupies the full screen height
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
       
          child
        ],
      ),
    );
  }
}
