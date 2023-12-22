import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/pages/dessert_page.dart';
import 'package:yemek_uygulamasi/pages/drink_page.dart';
import 'package:yemek_uygulamasi/pages/main_dish_page.dart';
import 'package:yemek_uygulamasi/pages/salad_page.dart';
import 'package:yemek_uygulamasi/pages/soup_page.dart';
import 'package:yemek_uygulamasi/pages/warm_starter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Categorys>> bringCategorys() async {
    var categoryList = <Categorys>[];

    var y1 = Categorys(1, 'Çorbalar', 'soup_category.png', SoupPage());
    var y2 = Categorys(2, 'Ara Sıcaklar', 'warm_starter_category.png', WarmStarterPage());
    var y3 = Categorys(3, 'Ana Yemek', 'main_dish_category.png', MainDishPage());
    var y4 = Categorys(4, 'Salatalar', 'salad_category.png', SaladPage());
    var y5 = Categorys(5, 'Tatlılar', 'desert_category.png', DessertPage());
    var y6 = Categorys(6, 'İçeçekler', 'drink_category.png', DrinkPage());

    categoryList.add(y1);
    categoryList.add(y2);
    categoryList.add(y3);
    categoryList.add(y4);
    categoryList.add(y5);
    categoryList.add(y6);

    return categoryList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title: Text('Yemek Sipariş Uygulaması', style: TextStyle(fontSize: 20),),
        actions:  [
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.settings),)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Kategoriler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              onTap: () {
                // Ana sayfaya gitmek için yapılacak işlemler buraya eklenebilir.
                Navigator.pop(context); // Drawer'ı kapat
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Çorbalar'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SoupPage())); // Drawer'ı kapat
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Ara Sıcaklar'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WarmStarterPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Ana Yemekler'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainDishPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Salatalar'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SaladPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.food_bank),
              title: Text('Tatlılar'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DessertPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('İçecekler'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              onTap: () {
                // Ayarlar sayfasına gitmek için yapılacak işlemler buraya eklenebilir.
                Navigator.pop(context); // Drawer'ı kapat
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Categorys>>(
        future: bringCategorys(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoryList = snapshot.data;

            return ListView.builder(
              itemCount: categoryList!.length,
              itemBuilder: (context, indeks) {
                var category = categoryList[indeks];

                return GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => category.category_page_route));
                  },
                  child: Card(
                      child: Row(
                        children: [
                          SizedBox(width: 150, height: 150,
                            child: Image.asset(
                                'assets/category_pictures/${category.category_picture_name}'),),
                          SizedBox(width: 50),
                          Text(category.category_name,
                                style: TextStyle(fontSize: 25),),


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

class Categorys {
  int category_id;
  String category_name;
  String category_picture_name;
  Widget category_page_route;

  Categorys(this.category_id, this.category_name, this.category_picture_name, this.category_page_route);
}
