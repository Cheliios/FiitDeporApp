import 'package:flutter/material.dart';

import '../controller/bottom_bar.dart';
import 'components/drawer.dart';
import 'deportes_page.dart';
import 'nutricion_page.dart';

void main() {
  runApp(const IntermedioPage());
}

class IntermedioPage extends StatelessWidget {
  const IntermedioPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntermedioScreen(),
      theme: ThemeData(
          fontFamily: "Urbanist",
      ),
    );
  }
}

class IntermedioScreen extends StatefulWidget {
  const IntermedioScreen({super.key});

  @override
  State<IntermedioScreen> createState() => _IntermedioScreen();
}


class _IntermedioScreen extends State<IntermedioScreen> {
  
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    onItemTappedPrincipal(context, index); // FUNCION BOTTOM_BAR
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("Ejercicios Nivel Intermedio"),
          backgroundColor: Color.fromARGB(255, 19, 19, 19),
        ),
        drawer: DrawerCustom(),

        backgroundColor: Color.fromARGB(255, 44, 44, 44),












        //BARRA DE NAVEGACION INFERIOR
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 19, 19, 19),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ejercicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Deportes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: 'Nutricion',
            ),
          ],

          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 255, 255, 255),
          onTap: _onItemTapped,
          unselectedItemColor: Color.fromARGB(150, 255, 255, 255),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
      ),


    );
  }
}
