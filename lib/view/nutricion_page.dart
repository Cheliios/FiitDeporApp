import 'dart:convert';

import 'package:fitdepor_app/controller/nutricion_content_controller.dart';
import 'package:fitdepor_app/view/components/drawer.dart';
// import 'package:fitdepor_app/view/deportes_page.dart';
// import 'package:fitdepor_app/view/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../controller/bottom_bar.dart';
import 'package:http/http.dart' as http;

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



///////////////////LLAMAR API PARA EL CONTENIDO
  String infoTitle1 = '';
  String infoContent1 = '';
  String infoTitle2 = '';
  String infoContent2 = '';
  String infoTitle3 = '';
  String infoContent3 = '';
  String infoTitle4 = '';
  String infoContent4 = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await getInfoData('info_nutricion1', (data) {
      setState(() {
        infoTitle1 = data['info_title'];
        infoContent1 = data['info_content'];
      });
    });

    await getInfoData('info_nutricion2', (data) {
      setState(() {
        infoTitle2 = data['info_title'];
        infoContent2 = data['info_content'];
      });
    });

    await getInfoData('info_nutricion3', (data) {
      setState(() {
        infoTitle3 = data['info_title'];
        infoContent3 = data['info_content'];
      });
    });

    await getInfoData('info_nutricion4', (data) {
      setState(() {
        infoTitle4 = data['info_title'];
        infoContent4 = data['info_content'];
      });
    });

  }

  Future<void> getInfoData(String infoName, Function(dynamic) callback) async {
    final response = await http.get(Uri.parse('https://fitdeporregisterloginprueba11imginfo-dot-thinking-creek-385613.uc.r.appspot.com/info/$infoName'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      callback(data);
    } else {
      // Error al obtener los datos
    }
  }

///////////////////////////////////////////////////////////////////


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
    // PRIMERA FILA DE CAJAS
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img1'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 163, 213, 219).withOpacity(0.9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          infoTitle1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          infoContent1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img2'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 157, 212, 158).withOpacity(0.9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          infoTitle2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          infoContent2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    // SEGUNDA FILA DE CAJAS
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img3'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 214, 214, 122).withOpacity(0.9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          infoTitle3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          infoContent3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_nutricion_img4'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 223, 154, 154).withOpacity(0.9),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          infoTitle4,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          infoContent4,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
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