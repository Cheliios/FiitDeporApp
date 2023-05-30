import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fitdepor_app/models/user_model.dart';

class AuthController {
  Future<bool> login(User user) async {
    final String apiUrl = "https://fitdeporregisterloginprueba11-dot-thinking-creek-385613.uc.r.appspot.com/login"; // Cambia esto a tu URL de API

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        'user_mail': user.user_mail,
        'user_password': user.user_password,
      }),

    );

    final responseData = jsonDecode(response.body);
    final statusCode = response.statusCode;
print('Response: ${response.body}');
    if (statusCode == 200 && responseData['success'] == true) {
      return true; // Inicio de sesión exitoso
    } else {
      return false; // Inicio de sesión fallido
    }
  }
}
