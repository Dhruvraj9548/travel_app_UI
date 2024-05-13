import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/main.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<City> cities = [
      City('Paris', 'assets/images/paris.jpg'),
      City('New York', 'assets/images/newyork.jpg'),
      City('London', 'assets/images/london.jpg'),
      City('Tokyo', 'assets/images/tokyo.jpg'),
      City('Rome', 'assets/images/rome.jpg'),
      City('Dubai', 'assets/images/dubai.jpg'),
    ];

    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(child: Text('Popular Cities')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: cities.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home'),));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(cities[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    cities[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class City {
  final String name;
  final String image;

  City(this.name, this.image);
}