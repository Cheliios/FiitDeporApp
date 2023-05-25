import 'package:flutter/material.dart';
import 'package:fitdepor_app/view/home_page.dart';
import 'package:fitdepor_app/view/registro_usuario.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  final String? usuario;
  final String? contrasena;

  Login({this.usuario, this.contrasena});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();


  //USADO PARA LOGIN _ 
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.usuario != null) {
      _usuarioController.text = widget.usuario!;
    }
  }

  @override
  void dispose() {
    _usuarioController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final url = 'https://fitdeporregisterloginprueba9-dot-thinking-creek-385613.uc.r.appspot.com/login';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'user_mail': _emailController.text,
        'user_password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      // Login exitoso
      print('Login exitoso');
    } else {
      // Error en el login
      print('Error en el login');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
        backgroundColor: Color.fromARGB(255, 175, 78, 78),
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                    onPressed: () {
                      // String usuario = _usuarioController.text;
                      // String contrasena = _contrasenaController.text;
                      // if (usuario.isNotEmpty && contrasena.isNotEmpty) {
                      //   if (usuario == widget.usuario &&
                      //       contrasena == widget.contrasena) {
                      //     // Inicio de sesión exitoso
                      //     showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return AlertDialog(
                      //           title: Text('Inicio de sesión exitoso'),
                      //           content: Text('¡Bienvenido, $usuario!'),
                      //           actions: [
                      //             TextButton(
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //                 Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) => HomePage()),
                      //                 );
                      //               },
                      //               child: Text('Aceptar'),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //   } else {
                      //     // Error de inicio de sesión
                      //     showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return AlertDialog(
                      //           title: Text('Error de inicio de sesión'),
                      //           content:
                      //               Text('Usuario o contraseña incorrectos'),
                      //           actions: [
                      //             TextButton(
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //               },
                      //               child: Text('Aceptar'),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     );
                      //   }
                      // } else {
                      //   // Campos vacíos
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: Text('Campos vacíos'),
                      //         content: Text(
                      //             'Por favor, ingrese usuario y contraseña'),
                      //         actions: [
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.pop(context);
                      //             },
                      //             child: Text('Aceptar'),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      // }
                    },
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
