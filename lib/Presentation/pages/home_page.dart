import 'package:flutter/material.dart';
import 'package:forbiddenburgerapp/Presentation/pages/burgers_page.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/meal_deals_container_widget.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/special_discounts_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/p13.png",
                width: size.width,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BurgersPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: const Color(0xffEEEEEE),
                            elevation: 0,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/hamburguesa.png",
                              fit: BoxFit.cover,
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        const Text(
                          "Hamburguesas",
                          style:
                              TextStyle(fontSize: 11, color: Color(0xff757575)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Acción cuando se presiona el botón
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: const Color(0xffEEEEEE),
                            elevation: 0,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/papas.png",
                              fit: BoxFit.cover,
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        const Text(
                          "Para acompañar",
                          style:
                              TextStyle(fontSize: 11, color: Color(0xff757575)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Acción cuando se presiona el botón
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10.0),
                            backgroundColor: const Color(0xffEEEEEE),
                            elevation: 0,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/refresco.png",
                              fit: BoxFit.cover,
                              width: 45,
                              height: 45,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                        const Text(
                          "Bebidas",
                          style:
                              TextStyle(fontSize: 11, color: Color(0xff757575)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              MealDealdsWidget(),
              SizedBox(height: 20),
              SpecialDiscountsContainer()
            ],
          ),
        ),
      ),
    );
  }
}
