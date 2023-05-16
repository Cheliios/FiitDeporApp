import 'package:fitdepor_app/view/components/drawer.dart';
import 'package:fitdepor_app/view/deportes_page.dart';
import 'package:fitdepor_app/view/nutricion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
void main () => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        home: MainPage(),
        theme: ThemeData(
          fontFamily: "Urbanist",
        ),
      );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}


// _______________________________________________


class _MainPage extends State<MainPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => DeportesPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => NutricionPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          title: Text("Entrenamiento"),
          backgroundColor: Color.fromARGB(255, 175, 78, 78),
        ),

        
        drawer: DrawerCustom(),
      
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Bienvenido a:",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Container(
                height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.network(
                        'https://storage.googleapis.com/fitsport-bucket/img-app/FitDepor_txt.png',
                      ).image,
                      fit: BoxFit.cover,
                    ),
                  ),
              ),
            ),





            SizedBox(height: 10),






            //NIVEL PRINCIPIANTE
            Container(
              height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      'https://storage.googleapis.com/fitsport-bucket/img-app/gif_principiante.gif',
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              child: Stack(
                children: [
                  // Capa adicional de color con transparencia
                  Positioned.fill(
                    child: Container(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                    ),
                  ),
                  // Título y párrafo
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nivel Principiante',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Este son unos ejercios ed nivel medio\n que te ayudaran a estar mejor \n fisicamente y mentalmente ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Botón
                  Positioned(
                    top: 80,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes colocar la acción que deseas realizar al presionar el botón
                      },
                      child: Text(
                        'Botón',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),




            SizedBox(height: 20),
            



            //NIVEL INTERMEDIO
            Container(
              height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      'https://storage.googleapis.com/fitsport-bucket/img-app/gif_intermedio.gif',
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              child: Stack(
                children: [
                  // Capa adicional de color con transparencia
                  Positioned.fill(
                    child: Container(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                    ),
                  ),
                  // Título y párrafo
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nivel Intermedio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Este son unos ejercios ed nivel medio\n que te ayudaran a estar mejor \n fisicamente y mentalmente ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Botón
                  Positioned(
                    top: 80,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes colocar la acción que deseas realizar al presionar el botón
                      },
                      child: Text(
                        'Botón',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),




            SizedBox(height: 20),
            


            //NIVEL AVANZADO
            Container(
              height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      'https://storage.googleapis.com/fitsport-bucket/img-app/gif_avanzado.gif',
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              child: Stack(
                children: [
                  // Capa adicional de color con transparencia
                  Positioned.fill(
                    child: Container(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                    ),
                  ),
                  // Título y párrafo
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nivel Avanzado',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Este son unos ejercios ed nivel medio\n que te ayudaran a estar mejor \n fisicamente y mentalmente ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Botón
                  Positioned(
                    top: 80,
                    right: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí puedes colocar la acción que deseas realizar al presionar el botón
                      },
                      child: Text(
                        'Botón',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),













        //BARRA DE NAVEGACION INFERIOR
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 175, 78, 78),
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