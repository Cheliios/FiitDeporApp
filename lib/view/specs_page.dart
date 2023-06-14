import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'home_page.dart';

void main() {
  runApp(const SpecsPage());
}

class SpecsPage extends StatelessWidget {
  const SpecsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpecsPages(),
    );
  }
}

class SpecsPages extends StatelessWidget {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;

  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  Widget showCard(String name, String value) {
    return Card(
      child: ListTile(
        title: Text(
          "$name : $value",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del Dispositivo'),
        backgroundColor: Color.fromARGB(255, 175, 78, 78),
      ),
      body: SafeArea(
        child: FutureBuilder<AndroidDeviceInfo>(
          future: getInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Mientras se carga la información, puedes mostrar un indicador de carga
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError || snapshot.data == null) {
              // Si hay un error o no se obtiene la información, puedes mostrar un mensaje de error
              return Center(
                child: Text('Error al obtener la información del dispositivo'),
              );
            }

            final data = snapshot.data!;

            return Column(
              children: [
                showCard('brand', data.brand!),
                showCard('device', data.device!),
                showCard('model', data.model!),
                showCard('manufacturer', data.manufacturer!),
                showCard('product', data.product!),
                showCard('hardware', data.hardware!),
                showCard('isPhysicalDevice', data.isPhysicalDevice.toString()),
                showCard('version', data.version.release.toString()),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Color.fromARGB(255, 175, 78, 78),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}