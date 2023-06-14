import 'package:fitdepor_app/view/home_page.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ejercicios Nivel Principiante"),
          backgroundColor: Color.fromARGB(255, 19, 19, 19),
        ),
        
        drawer: DrawerCustom(),

        backgroundColor: Color.fromARGB(255, 44, 44, 44),

        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Ejercicios Principiantes',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Image.network(
                      'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_ejercicio_principiante_logo',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 10),



            //EJERCICIOS BRAZOS
            Container(
              height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/pages_ejercicio_img1',
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
                          'Ejercicios Brazos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Brazos fuertes para principiantes:\nejercicios simples, resultados efectivos.',
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
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     transitionDuration: Duration(milliseconds: 500),
                        //     pageBuilder: (context, animation, secondaryAnimation) => PrincipianteScreen(),
                        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        //       return SlideTransition(
                        //         position: Tween<Offset>(
                        //           begin: Offset(1.0, 0.0),
                        //           end: Offset.zero,
                        //         ).animate(animation),
                        //         child: child,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      child: Text(
                        'Iniciar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[200],
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



             //EJERCICIOS PIERNAS
            Container(
              height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/pages_ejercicio_img2',
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
                          'Ejercicios Piernas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Piernas fuertes para principiantes:\nejercicios simples, resultados efectivos.',
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
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     transitionDuration: Duration(milliseconds: 500),
                        //     pageBuilder: (context, animation, secondaryAnimation) => IntermedioPage(),
                        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        //       return SlideTransition(
                        //         position: Tween<Offset>(
                        //           begin: Offset(1.0, 0.0),
                        //           end: Offset.zero,
                        //         ).animate(animation),
                        //         child: child,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      child: Text(
                        'Iniciar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[200],
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


             //EJERCICIOS ABDOMEN
            Container(
              height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/pages_ejercicio_img3',
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
                          'Ejercios Abdomen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Abdomen definido para principiantes:\nejercicios simples, resultados efectivos.',
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
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     transitionDuration: Duration(milliseconds: 500),
                        //     pageBuilder: (context, animation, secondaryAnimation) => AvanzadoPage(),
                        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        //       return SlideTransition(
                        //         position: Tween<Offset>(
                        //           begin: Offset(1.0, 0.0),
                        //           end: Offset.zero,
                        //         ).animate(animation),
                        //         child: child,
                        //       );
                        //     },
                        //   ),
                        // );
                      },
                      child: Text(
                        'Iniciar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[200],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Color.fromARGB(255, 175, 78, 78),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      
    );
  }
}
