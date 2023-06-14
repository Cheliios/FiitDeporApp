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
        home: SpecsPages());
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

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}