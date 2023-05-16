import 'package:fitdepor_app/view/components/drawer.dart';
import 'package:fitdepor_app/view/home_page.dart';
import 'package:fitdepor_app/view/nutricion_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main () => runApp(DeportesPage());

class DeportesPage extends StatelessWidget {
  const DeportesPage({super.key});

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        home: DeportesPages(),
        theme: ThemeData(
          fontFamily: "Urbanist",
        ),
      );
  }
}

class DeportesPages extends StatefulWidget {
  const DeportesPages({super.key});

  @override
  State<DeportesPages> createState() => _DeportesPages();
}


// _______________________________________________


class _DeportesPages extends State<DeportesPages> {

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
       Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
        break;
      case 1:
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
          title: Text("Deportes"),
          backgroundColor: Color.fromARGB(255, 64, 141, 146),
        ),


        drawer: DrawerCustom(),



        body: ListView(
          children: [


            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Noticias Deportivas',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Image.network(
                      'https://storage.googleapis.com/fitsport-bucket/img-app/corriendo.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),


            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Por la semifinal de ida, Real Madrid empató 1-1 con Manchester City',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    'https://storage.googleapis.com/fitsport-bucket/img-app/realmadrid_news.jpg',
                    height: 200,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'El Real Madrid empató 1-1 con el Manchester City este martes en la ida de semifinales de la Liga de Campeones en el Santiago Bernabéu dejando la eliminatoria abierta para la vuelta la próxima semana.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),




                        Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Por la semifinal de ida, Real Madrid empató 1-1 con Manchester City',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    'https://storage.googleapis.com/fitsport-bucket/img-app/realmadrid_news.jpg',
                    height: 200,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'El Real Madrid empató 1-1 con el Manchester City este martes en la ida de semifinales de la Liga de Campeones en el Santiago Bernabéu dejando la eliminatoria abierta para la vuelta la próxima semana.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Por la semifinal de ida, Real Madrid empató 1-1 con Manchester City',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    'https://storage.googleapis.com/fitsport-bucket/img-app/realmadrid_news.jpg',
                    height: 200,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'El Real Madrid empató 1-1 con el Manchester City este martes en la ida de semifinales de la Liga de Campeones en el Santiago Bernabéu dejando la eliminatoria abierta para la vuelta la próxima semana.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
          backgroundColor: Color.fromARGB(255, 64, 141, 146),
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