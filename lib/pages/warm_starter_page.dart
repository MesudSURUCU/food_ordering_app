import 'package:flutter/material.dart';

class WarmStarterPage extends StatefulWidget {
  const WarmStarterPage({super.key});

  @override
  State<WarmStarterPage> createState() => _WarmStarterPageState();
}

class _WarmStarterPageState extends State<WarmStarterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ara Sıcaklar"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(),
    );
  }
}

