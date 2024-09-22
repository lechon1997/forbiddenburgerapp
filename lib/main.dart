import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/Routes/generated_routes.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/landing_page_bloc/landing_page_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/login_bloc/login_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginBloc()),
          BlocProvider(create: (_) => LandingPageBloc()),
        ],
        child: MaterialApp(
          title: 'Menú Inferior App',
          theme: ThemeData(
            fontFamily: "Cherk",
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontWeight: FontWeight.normal), // Regular
              bodyMedium: TextStyle(fontWeight: FontWeight.normal), // Regular
              headlineMedium: TextStyle(fontWeight: FontWeight.bold), // Bold
            ),
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator().generateRoute,
        ));
  }
}
