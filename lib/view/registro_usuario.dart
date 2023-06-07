import 'package:flutter/material.dart';
import 'package:fitdepor_app/view/home_page.dart';
import 'package:fitdepor_app/view/login_page.dart';
// import 'package:http/http.dart' as http;
import 'package:fitdepor_app/controller/register_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RegistroUsuario extends StatefulWidget {
  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {


final RegisterController _registroController = RegisterController();

final TextEditingController _dniController = TextEditingController();
final TextEditingController _nicknameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _lastnameController = TextEditingController();
final TextEditingController _edadController = TextEditingController();
final TextEditingController _generoController = TextEditingController();
final TextEditingController _paisController = TextEditingController();
final TextEditingController _mailController = TextEditingController();

  //Variable par validar el formulario
  final _formKey = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }


  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (_generoController.text.isEmpty) {
        _showSnackBar('Falta seleccionar el género');
        return;
      }

      final registrationResult = await _registroController.registerUser(
        _dniController.text,
        _nicknameController.text,
        _passwordController.text,
        _nameController.text,
        _lastnameController.text,
        _edadController.text,
        _generoController.text,
        _paisController.text,
        _mailController.text,
      );

      if (registrationResult == 'OK') {
        // Mostrar mensaje de éxito
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/img/corazon.gif'),
                    SizedBox(height: 20),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Registro exitoso',
                          textStyle: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(seconds: 2),
                      displayFullTextOnTap: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar el diálogo
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: Text('Ir a iniciar sesión'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
      
      } else {
        // Mostrar mensaje de error
        _showSnackBar('Una cuenta ya se encuentra registrada con este DNI');
      }
    } else {
      _showSnackBar('Falta completar campos obligatorios');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
        backgroundColor: Color.fromARGB(255, 175, 78, 78),
      ),
      body: SingleChildScrollView(
        // Agregar SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  TextFormField(
                    controller: _dniController,
                    decoration: InputDecoration(
                      labelText: 'DNI',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu DNI';
                      }
                      return null;
                  },
                    
                    // onSaved: (value) => dni = value!, // Guardar el valor de la contraseña
                  ),



                  TextFormField(
                    controller: _nicknameController,
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Usuario';
                      }
                      return null;
                  },
                    // onSaved: (value) => usuario = value!,
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
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),

                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Contraseña';
                      }
                      return null;
                  },
                    // onSaved: (value) => contrasena = value!, // Guardar el valor de la contraseña
                  ),


                  SizedBox(height: 16.0),


                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(
                        255, 175, 78, 78), 

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Nombre';
                      }
                      return null;
                  },// Cambia aquí el color del cursor
                    // onSaved: (value) => nombre = value!,
                  ),


                  SizedBox(height: 16.0),


                  TextFormField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      labelText: 'Apellidos',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Apellido';
                      }
                      return null;
                  },
                    // onSaved: (value) => apellidos = value!,
                  ),


                  SizedBox(height: 16.0),


                  TextFormField(
                    controller: _edadController,
                    decoration: InputDecoration(
                      labelText: 'Edad',
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
                    cursorColor: Color.fromARGB(
                        255, 175, 78, 78), // Cambia aquí el color del cursor
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Edad';
                      }
                      return null;
                  },
                    // onSaved: (value) => edad = int.parse(value!),
                  ),

                  SizedBox(height: 16.0),

                  Text(
                    'Género',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(
                          255, 175, 78, 78), // Cambia aquí el color del texto
                    ),
                  ),


                  SizedBox(height: 8.0),


                  RadioListTile<String>(
                    title: Text(
                      'Hombre',
                      style: TextStyle(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ),
                    ),
                    value: 'Hombre',
                    groupValue: _generoController.text,
                    onChanged: (value) => setState(() => _generoController.text = value!),
                    activeColor: Color.fromARGB(255, 175, 78, 78),
                  ),
                  RadioListTile<String>(
                    title: Text(
                      'Mujer',
                      style: TextStyle(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ),
                    ),
                    value: 'Mujer',
                    groupValue: _generoController.text,
                    onChanged: (value) => setState(() => _generoController.text = value!),
                    activeColor: Color.fromARGB(255, 175, 78, 78),
                  ),
                  RadioListTile<String>(
                    title: Text(
                      'Otro',
                      style: TextStyle(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ),
                    ),
                    value: 'Otro',
                    groupValue: _generoController.text,
                    onChanged: (value) => setState(() => _generoController.text = value!),
                    activeColor: Color.fromARGB(255, 175, 78, 78),
                  ),

                  SizedBox(height: 16.0),


                  TextFormField(
                    controller: _paisController,
                    decoration: InputDecoration(
                      labelText: 'País',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),
                    
                       validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Pais';
                      }
                      return null;
                  },
                    // onSaved: (value) => pais = value!,
                  ),


                  SizedBox(height: 16.0),


                  TextFormField(
                    controller: _mailController,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(
                            255, 175, 78, 78), // Cambia aquí el color del texto
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 175, 78, 78),
                      ) // Cambia aquí el color de la línea
                          ),
                    ),
                    cursorColor: Color.fromARGB(255, 175, 78, 78),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu Correo Electronico';
                      }
                      return null;
                  },
                    // onSaved: (value) => correo = value!,
                  ),

                  SizedBox(height: 16.0),

                  ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 175, 78,
                          78), // Cambia aquí el color de fondo del botón
                    ),
                    child: Text('Registrarse'),
                  ),
                ],
              )),
              
        ),
      ),
    );
  }
}
