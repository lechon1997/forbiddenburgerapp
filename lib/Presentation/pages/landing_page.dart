import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/landing_page_bloc/landing_page_bloc.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/landing_page_bloc/landing_page_event.dart';
import 'package:forbiddenburgerapp/Presentation/bloc/landing_page_bloc/landing_page_state.dart';
import 'package:forbiddenburgerapp/Presentation/pages/home_page.dart';
import 'package:forbiddenburgerapp/Presentation/widgets/profile_wrapper.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Inicio',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Mis Compras',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.card_giftcard),
    label: 'Cupones',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Perfil',
  ),
];

const List<Widget> bottomNavPages = <Widget>[
  HomePage(),
  Text('Mis Compras'),
  Text('Cupones'),
  ProfileWrapper(),
];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<int> _navigationStack = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("pijazo fino x2");
        final currentIndex = context.read<LandingPageBloc>().state.tabIndex;

        if (_navigationStack.isNotEmpty) {
          final previousIndex = _navigationStack.removeLast();
          BlocProvider.of<LandingPageBloc>(context)
              .add(TabChange(tabIndex: previousIndex));
          return false;
        }

        if (currentIndex == 0) {
          return true;
        }

        return false;
      },
      child: BlocConsumer<LandingPageBloc, LandingPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(child: bottomNavPages.elementAt(state.tabIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              selectedItemColor: Colors.orange[700],
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                if (index != state.tabIndex) {
                  _navigationStack.add(state.tabIndex);
                }

                BlocProvider.of<LandingPageBloc>(context)
                    .add(TabChange(tabIndex: index));
              },
            ),
          );
        },
      ),
    );
  }
}
