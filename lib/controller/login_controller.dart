import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

import 'package:http/http.dart' as http;
import '../models/user_singleton.dart';
import '../view/home_page.dart';

class LoginController {
  
  final UserModel userModel = UserModel();
  
  Future<void> login(BuildContext context, String email, String password) async {
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

    var url = 'https://fitdeporregisterloginprueba10-dot-thinking-creek-385613.uc.r.appspot.com/login';
    var response = await http.post(
      Uri.parse(url),
      body: {
        'user_mail': email,
        'user_password': password,
      },
    );



    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      if (response.body == 'OK') {

        final db = await userModel.openMyDatabase();
        await db.insert('users', {
          'user_mail': email,
          'user_password': password,
        });
        
        UserSingleton().setUserEmail(email); // Establecer el correo electrónico en el Singleton
        
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
                      Image.asset(
                        'assets/img/gif_check.gif',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 20),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            '¡Has iniciado sesión exitosamente!',
                            textStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: Duration(milliseconds: 50),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: Duration(seconds: 1),
                        displayFullTextOnTap: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Cerrar el diálogo
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        child: Text('Continuar'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Ups! Hubo un problema'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/img/gif_alerta.gif',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text('Contraseña o correo equivocado.'),
                  ],
                ),
              ),
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
}