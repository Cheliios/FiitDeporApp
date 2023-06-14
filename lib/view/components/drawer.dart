import 'package:fitdepor_app/view/about_us.dart';
import 'package:fitdepor_app/view/home_page.dart';
import 'package:fitdepor_app/view/specs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitdepor_app/view/donacion.dart';
import 'package:battery/battery.dart';

import '../../models/user_model.dart';
import '../../models/user_singleton.dart';

void main() => runApp(DrawerApp());

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerCustom(),
      theme: ThemeData(
        fontFamily: "Urbanist",
      ),
    );
  }
}

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustom();
}

// _______________________________________________

class _DrawerCustom extends State<DrawerCustom> {
  @override
  void initState() {
    super.initState();
    _obtenerNivelBateria();
  }

  Battery _battery = Battery();
  String _batteryLevel = 'Desconocido';

  Future<void> _obtenerNivelBateria() async {
    int batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel.toString() + '%';
    });
  }

  Icon getBatteryIcon() {
    IconData batteryIcon;
    Color batteryColor;

    if (_batteryLevel.contains('%')) {
      int level = int.parse(_batteryLevel.replaceAll('%', ''));
      if (level >= 90) {
        batteryIcon = Icons.battery_full;
        batteryColor = Colors.green;
      } else if (level >= 50) {
        batteryIcon = Icons.battery_std;
        batteryColor = Colors.yellow;
      } else {
        batteryIcon = Icons.battery_alert;
        batteryColor = Colors.red;
      }
    } else {
      batteryIcon = Icons.battery_unknown;
      batteryColor = Colors.white;
    }

    return Icon(
      batteryIcon,
      color: batteryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    String? userEmail = UserSingleton()
        .getUserEmail(); // Obtener el correo electrónico del Singleton

    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 70, 79, 99),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 39, 43, 51),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Batería: $_batteryLevel",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    getBatteryIcon(),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 40, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenido: $userEmail",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 250,
              height: 150,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/FitDepor_txt.png"))),
            ),

            //NAVEGACION VENTANA PRINCIPAL
            Container(
              child: ListTile(
                title: Text(
                  "Pagina Principal",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          MainPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            //NAVEGACION VENTANA NOSOTROS

            Container(
              child: ListTile(
                title: Text(
                  "Nosotros",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                leading: Icon(
                  Icons.group,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Nosotros(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            //NAVEGACION VENTANA EMERGENTE AGRADECIMIENTOS
            Container(
              child: ListTile(
                title: Text(
                  "Agradecimiento",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                leading: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 44, 44, 44),
                          title: Text(
                            "¡Hola usuarios!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Agradecemos tu apoyo a nuestra aplicación. Ten en cuenta que actualmente se trata solo de una maqueta, pero estamos trabajando arduamente para agregar más funcionalidades y contenido en el futuro. ¡Gracias por formar parte de nuestro viaje hacia una aplicación aún mejor!🤩",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 120),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DonacionPage(
                                          url:
                                              'https://www.paypal.com/donate/?hosted_button_id=DFLXVZMKT99PY',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Donar',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                ),
                                // Ajusta el ancho según sea necesario
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Cerrar',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 255, 10, 10)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      });
                },
              ),
            ),

            Container(
              child: ListTile(
                title: Text(
                  "Caracteristicas",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                leading: Icon(
                  Icons.settings_applications_outlined,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SpecsPages(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            Expanded(child: Container()),

            Container(
              width: 130,
              child: ElevatedButton(
                onPressed: () => {SystemNavigator.pop()},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 121, 131, 165),
                ),
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 20),
                    Text(
                      "Salir",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
