import 'package:flutter/material.dart';
import 'package:pakeaja/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemrograman Bergerak'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black),
          // ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                ),
                width: 350,
                height: 350,
                padding: const EdgeInsets.all(30),
                // add image
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/slide3.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                ),
                width: 350,
                height: 60,
                padding: const EdgeInsets.all(20),
                child: const Text('What image is that?',
                    textAlign: TextAlign.start),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                ),
                width: 350,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //tambahkan 3 container dan 3 icon masing2
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          Icon(Icons.food_bank),
                          Text('Food'),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          Icon(Icons.umbrella),
                          Text('Scenery'),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Column(
                        children: [
                          Icon(Icons.person),
                          Text('People'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
