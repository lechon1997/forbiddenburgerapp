import 'package:flutter/material.dart';

class EnterPhonePage  extends StatelessWidget{
  const EnterPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("volver"),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
              "assets/images/p11.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }
}