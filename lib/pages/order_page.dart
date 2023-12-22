import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/foods_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key, });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.center,
          child: Text("Yemek Uygulaması", style: TextStyle(color: Colors.black), )),
      backgroundColor: Colors.blue,
      ) ,
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
            child: Text("Siparişiniz Alınmıştır", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
    ],
      ),
    ) ,
    );
  }
}
