import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fitdepor_app/view/components/drawer.dart';
import '../view/home_page.dart';

class DonacionPage extends StatelessWidget {
  final String url;

  DonacionPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donación'),
        backgroundColor: Color.fromARGB(255, 175, 78, 78),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
