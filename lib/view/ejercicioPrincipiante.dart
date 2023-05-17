import 'package:flutter/material.dart';

import 'components/drawer.dart';
import 'deportes_page.dart';
import 'nutricion_page.dart';
import 'package:fitdepor_app/controller/bottom_bar.dart';

void main() {
  runApp(const PrincipiantePage());
}

class PrincipiantePage extends StatelessWidget {
  const PrincipiantePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrincipianteScreen(),
      theme: ThemeData(
          fontFamily: "Urbanist",
      ),
    );
  }
}

class PrincipianteScreen extends StatefulWidget {
  const PrincipianteScreen({super.key});

  @override
  State<PrincipianteScreen> createState() => _PrincipianteScreen();
}


class _PrincipianteScreen extends State<PrincipianteScreen> {

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
          title: Text("Ejercicios Nivel Principiante"),
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
