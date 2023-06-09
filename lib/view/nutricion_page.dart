import 'package:fitdepor_app/view/components/drawer.dart';
// import 'package:fitdepor_app/view/deportes_page.dart';
// import 'package:fitdepor_app/view/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../controller/bottom_bar.dart';

void main () => runApp(NutricionPage());

class NutricionPage extends StatelessWidget {
  const NutricionPage({super.key});

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        home: NutricionPages(),
        theme: ThemeData(
          fontFamily: "Urbanist",
        ),
      );
  }
}

class NutricionPages extends StatefulWidget {
  const NutricionPages({super.key});

  @override
  State<NutricionPages> createState() => _NutricionPages();
}


// _______________________________________________


class _NutricionPages extends State<NutricionPages> {

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    onItemTappedNutricion(context, index); // FUNCION BOTTOM_BAR
  }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Información Nutricional',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Image.network(
                      'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_logo',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),


          //PRIMERA FILA CAJAS
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img1'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Color.fromARGB(255, 163, 213, 219).withOpacity(0.9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Beneficios del aguacate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'El aguacate es rico en grasas saludables, fibra y nutrientes como la vitamina E, C y potasio.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img2'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Color.fromARGB(255, 157, 212, 158).withOpacity(0.9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Beneficios de la manzana',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'La manzana es una fruta rica en fibra y antioxidantes que ayuda a mejorar la digestión, mantener el corazón sano y prevenir enfermedades como la diabetes.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


          //SEGUNDA FILA CAJAS
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img3'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Color.fromARGB(255, 214, 214, 122).withOpacity(0.9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Beneficios del té verde',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'El té verde es rico en antioxidantes y compuestos bioactivos que pueden mejorar la función cerebral.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img4'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Color.fromARGB(255, 223, 154, 154).withOpacity(0.9),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Beneficios de la vitamina C',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'La vitamina C es un nutriente esencial que tiene numerosos beneficios para la salud, como mejorar la función inmunológica,',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        
            
          ],
        ),





        //BARRA DE NAVEGACION INFERIOR
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 78, 146, 64),
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