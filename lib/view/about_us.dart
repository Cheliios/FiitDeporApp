import 'package:flutter/material.dart';

import 'components/drawer.dart';

void main() {
  runApp(const AboutUs());
}

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Nosotros(),
        theme: ThemeData(
          fontFamily: "Urbanist",
        ),
    );
  }
}

class Nosotros extends StatefulWidget {
  const Nosotros({super.key,});


  @override
  State<Nosotros> createState() => _Nosotros();
}

class _Nosotros extends State<Nosotros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
          title: Text("Nutrición"),
          backgroundColor: Color.fromARGB(255, 78, 146, 64),
        ),


        drawer: DrawerCustom(),

        body: ListView(
          children: [


            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nosotros',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Image.network(
                    'https://storage.googleapis.com/fitsport-bucket/img-app/grupo.png',
                    height: 100,
                  ),
                ],
              ),
            ),


            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                    child: Text(
                      'Somos el Grupo 2, un equipo dedicado y apasionado por el fitness y la vida saludable. Hemos creado esta aplicación para brindarte una experiencia completa en tu viaje hacia una vida activa. Descubre una amplia variedad de ejercicios diseñados para todos los niveles, desde principiantes hasta avanzados.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),



          ],
        ),


    );
  }
}
