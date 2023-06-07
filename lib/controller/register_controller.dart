import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterController {
  Future<String> registerUser(
    String dni,
    String nickname,
    String password,
    String name,
    String lastname,
    String edad,
    String genero,
    String pais,
    String mail,
  ) async {
    final url = 'https://fitdeporregisterloginprueba10-dot-thinking-creek-385613.uc.r.appspot.com/register';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'user_dni': dni,
        'user_nickname': nickname,
        'user_password': password,
        'user_name': name,
        'user_lastname': lastname,
        'user_edad': edad,
        'user_genero': genero,
        'user_pais': pais,
        'user_mail': mail,
      },
    );

    if (response.statusCode == 200) {
      print('Registro exitoso');
      return 'OK'; // Registro exitoso

    } else if (response.statusCode == 400) {
      final errorResponse = json.decode(response.body);
      final errorMessage = errorResponse['error'];
      print('Error en el registro: $errorMessage');
      return errorMessage; // Error de registro
      
    } else {
      print('Error desconocido');
      return 'Error desconocido'; // Otro tipo de error
    }
  }
}