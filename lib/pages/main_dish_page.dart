import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/detail_page.dart';
import 'package:yemek_uygulamasi/pages/foods_page.dart';

class MainDishPage extends StatefulWidget {
  const MainDishPage({super.key});

  @override
  State<MainDishPage> createState() => _MainDishPageState();
}

class _MainDishPageState extends State<MainDishPage> {

  Future<List<Foods>> bringFoods() async {
    var foodList = <Foods>[];

    var y1 = Foods(1, 'Köfte', 'kofte.png', 15.99);
    var y2 = Foods(4, 'Makarna', 'makarna.png', 14.99);


    foodList.add(y1);
    foodList.add(y2);
    //foodList.add(y5);
    //foodList.add(y6);

    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Yemekler"),
        backgroundColor: Colors.blue,
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
                                'assets/pictures/${food.food_picture_name}'),),
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
