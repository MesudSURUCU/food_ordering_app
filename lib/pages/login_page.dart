import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.center,
            child: Text("Yemek Uygulaması")),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hoşgeldiniz, Afiyet Olsun", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
              child: Text("Misafir Girişi Yap", style: TextStyle(color: Colors.black, fontSize: 20),),
              style: ElevatedButton.styleFrom(fixedSize: Size(300, 80), backgroundColor: Colors.orange),

          ),
          ],
        ),
      ),
    );
  }
}
