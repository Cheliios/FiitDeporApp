import 'package:flutter/material.dart';

void main() {
  runApp(const PrincipiantePage());
}

class PrincipiantePage extends StatelessWidget {
  const PrincipiantePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrincipianteScreen(),
      theme: ThemeData(
          fontFamily: "Urbanist",
      ),
    );
  }
}

class PrincipianteScreen extends StatefulWidget {
  const PrincipianteScreen({super.key});

  @override
  State<PrincipianteScreen> createState() => _PrincipianteScreen();
}


class _PrincipianteScreen extends State<PrincipianteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
