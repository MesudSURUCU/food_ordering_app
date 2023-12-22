import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/foods_page.dart';

class SoupPage extends StatefulWidget {
  const SoupPage({super.key});

  @override
  State<SoupPage> createState() => _SoupPageState();
}

class _SoupPageState extends State<SoupPage> {
  Future<List<Foods>> bringFoods() async {
    var foodList = <Foods> [];


    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Çorbalar"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(),
    );
  }
}
