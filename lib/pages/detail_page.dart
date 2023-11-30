import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/foods_page.dart';
import 'package:yemek_uygulamasi/pages/order_page.dart';

class DetailPage extends StatefulWidget {

  final Foods food;
  const DetailPage({super.key, required this.food} );


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Align(
            alignment: Alignment.center,
            child: Text(widget.food.food_name)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('pictures/${widget.food.food_picture_name}'),
          Text('${widget.food.food_price} \u{20BA}', style: TextStyle(fontSize: 48, color: Colors.blue),),
          SizedBox(
            width: 200, height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text('SİPARİŞ VER', style: TextStyle(color: Colors.white),),
                onPressed: (){
             print('${widget.food.food_name} sipariş verildi');
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderPage()));
            }
      ),
          ),
        ],
        ),
      ),
    );
  }
}
