import 'package:flutter/material.dart';
import 'package:fitdepor_app/view/home_page.dart';
import 'package:fitdepor_app/view/login_page.dart';

class RegistroUsuario extends StatefulWidget {
  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  String usuario = '';
  String contrasena = '';
  String nombre = '';
  String apellidos = '';
  int edad = 0;
  String genero = '';
  String pais = '';
  String correo = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showSuccessDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Por favor, completa los campos de usuario y contraseña')),
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el cuadro de diálogo de error
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    if (usuario.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Por favor, completa los campos de usuario y contraseña')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro exitoso'),
          content: Text('Se ha registrado con éxito'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el cuadro de diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Login(usuario: usuario, contrasena: contrasena),
                  ),
                );
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
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
                    onSaved: (value) => usuario = value!,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    onSaved: (value) => contrasena =
                        value!, // Guardar el valor de la contraseña
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                        255, 175, 78, 78), // Cambia aquí el color del cursor
                    onSaved: (value) => nombre = value!,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    onSaved: (value) => apellidos = value!,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    onSaved: (value) => edad = int.parse(value!),
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
                        color: Color.fromARGB(255, 175, 78,
                            78), // Cambia aquí el color del texto para la opción "Hombre"
                      ),
                    ),
                    value: 'Hombre',
                    groupValue: genero,
                    onChanged: (value) => setState(() => genero = value!),
                    activeColor: Color.fromARGB(255, 175, 78,
                        78), // Cambia aquí el color de la "bolita"
                  ),
                  RadioListTile<String>(
                    title: Text(
                      'Mujer',
                      style: TextStyle(
                        color: Color.fromARGB(255, 175, 78,
                            78), // Cambia aquí el color del texto para la opción "Hombre"
                      ),
                    ),
                    value: 'Mujer',
                    groupValue: genero,
                    onChanged: (value) => setState(() => genero = value!),
                    activeColor: Color.fromARGB(255, 175, 78,
                        78), // Cambia aquí el color de la "bolita"
                  ),
                  RadioListTile<String>(
                    title: Text(
                      'Otro',
                      style: TextStyle(
                        color: Color.fromARGB(255, 175, 78,
                            78), // Cambia aquí el color del texto para la opción "Hombre"
                      ),
                    ),
                    value: 'Otro',
                    groupValue: genero,
                    onChanged: (value) => setState(() => genero = value!),
                    activeColor: Color.fromARGB(255, 175, 78,
                        78), // Cambia aquí el color de la "bolita"
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    onSaved: (value) => pais = value!,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    onSaved: (value) => correo = value!,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 175, 78,
                          78), // Cambia aquí el color de fondo del botón
                    ),
                    child: Text('Siguiente'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
