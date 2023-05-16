import 'package:fitdepor_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main () => runApp(DrawerApp());

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
  Widget build(BuildContext context) {

        return Drawer(
          child: Container(
            color: Color.fromARGB(255, 70, 79, 99),
            child: Column(

              children: [

                Container(
                  margin: EdgeInsets.fromLTRB(10, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Bienvenido: ",
                        style: TextStyle(
                          fontSize: 20,
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
                  margin: const EdgeInsets.fromLTRB(0, 0, 0 , 0 ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/FitDepor_txt.png")
                      )
                  ),
                ),
                
                
                
                //NAVEGACION VENTANA PRINCIPAL
                Container(
                  child: ListTile(
                    title: Text("Pagina Principal", style: TextStyle(fontSize: 20, color: Colors.white),),
                    leading: Icon(Icons.home, color: Colors.white,),
                    onTap: (){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                    title: Text("Nosotros", style: TextStyle(fontSize: 20, color: Colors.white),),
                    leading: Icon(Icons.group, color: Colors.white,),
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MyApp())
                      // );
                    },
                  ),
                ),


                //NAVEGACION VENTANA EMERGENTE AGRADECIMIENTOS
                Container(
                  child: ListTile(
                    title: Text("Agradecimiento", style: TextStyle(fontSize: 20, color: Colors.white),),
                    leading: Icon(Icons.star, color: Colors.white,),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context){    
                                              
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(255, 44, 44, 44),
                            title: Text("¡Hola usuarios!", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Queríamos agradecerles por utilizar nuestra primera aplicación desarrollada en Flutter, una calculadora. Apreciamos su confianza al elegir nuestra aplicación y esperamos que les haya gustado y les haya sido útil.", style: TextStyle(color: Colors.white,fontSize: 18),),

                              ],
                            ),
                          
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cerrar', style: TextStyle(fontSize: 20,color: Colors.cyan),),
                              ),
                            ],
                          );

                        }
                      );
                    },
                  ),
                ),

                Expanded(child: Container()),

                Container(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () => {
                      SystemNavigator.pop()
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 121, 131, 165)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(width: 20),
                        Text("Salir", style: TextStyle(fontSize: 20, color: Colors.white),),
                      ],
                    ),
                  ),
                ),

              SizedBox(height: 10,)

              ],
            ),
          ),
        );
        
  }
}