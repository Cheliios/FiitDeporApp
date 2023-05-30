import 'dart:math';

import 'package:fitdepor_app/view/registro_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'dart:convert';

import 'package:fitdepor_app/models/user_model.dart';
import 'package:fitdepor_app/controller/auth_controller.dart';
import 'package:http/http.dart' as http;

void main () => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        home: LoginPages(),
        theme: ThemeData(
          fontFamily: "Urbanist",
        ),
      );
  }
}

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPages();
}


// _______________________________________________


class _LoginPages extends State<LoginPages> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Por favor, ingresa tu email y contraseña.'),
            actions: [
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Realizar la solicitud POST al backend
    var url = 'https://fitdeporregisterloginprueba9-dot-thinking-creek-385613.uc.r.appspot.com/login';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'user_mail': email,
        'user_password': password,
      },
    );
print('Response: ${response.body}');
    if (response.statusCode == 200) {
      // Verificar la respuesta del backend
      if (response.body == 'OK') {
        // Iniciar sesión exitoso, redirigir a otra página
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomePage(),
          ),
        );
      } else {
        // Usuario no encontrado o contraseña incorrecta
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Contraseña o correo equivocado.'),
              actions: [
                TextButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // Error en la solicitud al backend
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error al realizar la solicitud.'),
            actions: [
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
        backgroundColor: Color.fromARGB(255, 94, 175, 78),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              // Aquí puedes configurar el tamaño y estilo de la imagen
              child: Image.asset('assets/img/FitDepor_logo.png'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo Electronico',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 175, 78,
                              78), // Cambia aquí el color de la línea
                        ),
                      ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),
                  ),


                  SizedBox(height: 16.0),


                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 175, 78,
                              78), // Cambia aquí el color de la línea
                        ),
                      ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),
                    obscureText: true,
                  ),


                  SizedBox(height: 16.0),


                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 175, 78, 78) // Cambia aquí el color del botón
                        ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255,
                            255), // Cambia aquí el color del texto
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistroUsuario()),
                      );
                    },
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      // Lógica para continuar sin iniciar sesión
                    },
                    child: Text(
                      'Continuar sin Iniciar Sesión',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para cerrar la aplicación
          Navigator.pop(context);
        },
        backgroundColor: Color.fromARGB(
            255, 175, 78, 78), // Cambia aquí el color del botón flotante
        child: Icon(Icons.exit_to_app),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}