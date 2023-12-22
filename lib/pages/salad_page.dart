import 'package:flutter/material.dart';

class SaladPage extends StatefulWidget {
  const SaladPage({super.key});

  @override
  State<SaladPage> createState() => _SaladPageState();
}

class _SaladPageState extends State<SaladPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salatalar"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(),
    );
  }
}
