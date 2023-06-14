import 'dart:convert';

import 'package:fitdepor_app/view/components/drawer.dart';
// import 'package:fitdepor_app/view/home_page.dart';
// import 'package:fitdepor_app/view/nutricion_page.dart';
import 'package:fitdepor_app/controller/bottom_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../controller/nutricion_content_controller.dart';


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

    onItemTappedDeportes(context, index); // FUNCION BOTTOM_BAR
  }

  String infoTitle1 = '';
  String infoContent1 = '';
  String infoTitle2 = '';
  String infoContent2 = '';
  String infoTitle3 = '';
  String infoContent3 = '';
  String infoTitle4 = '';
  String infoContent4 = '';
  String infoTitle5 = '';
  String infoContent5 = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await getInfoData('info_noticia1', (data) {
      setState(() {
        infoTitle1 = data['info_title'];
        infoContent1 = data['info_content'];
      });
    });

    await getInfoData('info_noticia2', (data) {
      setState(() {
        infoTitle2 = data['info_title'];
        infoContent2 = data['info_content'];
      });
    });

    await getInfoData('info_noticia3', (data) {
      setState(() {
        infoTitle3 = data['info_title'];
        infoContent3 = data['info_content'];
      });
    });

    await getInfoData('info_noticia4', (data) {
      setState(() {
        infoTitle4 = data['info_title'];
        infoContent4 = data['info_content'];
      });
    });

    await getInfoData('info_noticia5', (data) {
      setState(() {
        infoTitle5 = data['info_title'];
        infoContent5 = data['info_content'];
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
                      'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_deportes_logo',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),



    //PRIMERA NOTICIA
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_deportes_noticia1',
                ),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                infoTitle1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),


    Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 1.0,
      color: Colors.black,
    ),


    //SEGUNDA NOTICIA
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      infoTitle2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(width: 10),


            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: Image.network(
                    'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_deportes_noticia2',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),

    Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 1.0,
      color: Colors.black,
    ),



    //TERCERA NOTICIA
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      infoTitle3,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: Image.network(
                    'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_deportes_noticia3',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),



    Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 1.0,
      color: Colors.black,
    ),


    //CUARTA NOTICIA
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      infoTitle4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: Image.network(
                    'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_deportes_noticia4',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),

        Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 1.0,
      color: Colors.black,
    ),

    //QUINTA NOTICIA
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      infoTitle5,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  child: Image.network(
                    'https://fitdeporregisterloginprueba11img-dot-thinking-creek-385613.uc.r.appspot.com/images/page_deportes_noticia5',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
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