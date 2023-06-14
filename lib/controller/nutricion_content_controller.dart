// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DeportesController {
//   String infoTitle1 = '';
//   String infoContent1 = '';
//   String infoTitle2 = '';
//   String infoContent2 = '';

//   Future<void> fetchData() async {
//     await getInfoData('info_noticias_deportes1', (data) {
//       infoTitle1 = data['info_title'];
//       infoContent1 = data['info_content'];
//     });

//     await getInfoData('info_noticias_deportes2', (data) {
//       infoTitle2 = data['info_title'];
//       infoContent2 = data['info_content'];
//     });
//   }

//   Future<void> getInfoData(String infoName, Function(dynamic) callback) async {
//     final response = await http.get(Uri.parse('https://fitdeporregisterloginprueba11imginfo-dot-thinking-creek-385613.uc.r.appspot.com/info/$infoName'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       callback(data);
//     } else {
//       // Error al obtener los datos
//     }
//   }
// }