import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/detail_page.dart';
import 'package:yemek_uygulamasi/pages/foods_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Foods>> bringFoods() async {
    var foodList = <Foods>[];

    var y1 = Foods(1, 'Köfte', 'kofte.png', 15.99);
    var y2 = Foods(2, 'Ayran', 'ayran.png', 2.0);
    var y3 = Foods(3, 'Fanta', 'fanta.png', 3.0);
    var y4 = Foods(4, 'Makarna', 'makarna.png', 14.99);
    var y5 = Foods(5, 'Kadayıf', 'kadayif.png', 8.50);
    var y6 = Foods(6, 'Baklava', 'baklava.png', 15.99);

    foodList.add(y1);
    foodList.add(y2);
    foodList.add(y3);
    foodList.add(y4);
    foodList.add(y5);
    foodList.add(y6);

    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Align(
            alignment: Alignment.center,
            child: Text('Yemekler')),
      ),
      body: FutureBuilder<List<Foods>>(
        future: bringFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var foodList = snapshot.data;

            return ListView.builder(
              itemCount: foodList!.length,
              itemBuilder: (context, indeks) {
                var food = foodList[indeks];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailPage(food: food,)));
                  },
                  child: Card(
                      child: Row(
                        children: [
                          SizedBox(width: 150, height: 150,
                            child: Image.asset(
                                'pictures/${food.food_picture_name}'),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(food.food_name,
                                style: TextStyle(fontSize: 25),),
                              SizedBox(height: 50),
                              Text('${food.food_price} \u{20BA}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.blue),),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      )
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}




