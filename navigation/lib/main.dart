import 'package:flutter/material.dart';
import 'package:navigation/pages/home.dart';
import 'package:navigation/pages/location.dart';
import 'package:navigation/pages/music.dart';
import 'package:navigation/pages/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.location_city), label: "Location"),
    const BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "music"),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];
  int _index = 0;
  Widget _body = const Home();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Builder(builder: (context){
          return Drawer(
          child: ListView(
            children:  [
              const DrawerHeader(child: Text('My Application')),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _index = 0;
                    _body = const Home();
                  });
                },
                child:  ListTile(
                  tileColor: ( _index == 0) ? Colors.grey : Colors.white,
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _index = 1;
                    _body = const Location();
                  });
                },
                child:  ListTile(
                  tileColor: ( _index == 1) ? Colors.grey : Colors.white,
                  leading: const Icon(Icons.location_city_outlined),
                  title: const Text('Location'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _index = 2;
                    _body = const Music();
                  });
                },
                child:  ListTile(
                  tileColor: ( _index == 2) ? Colors.grey : Colors.white,
                  leading: Icon(Icons.music_note),
                  title: Text('Music'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _index = 3;
                    _body = const Setting();
                  });
                },
                child:  ListTile(
                  tileColor: ( _index == 3) ? Colors.grey : Colors.white,
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                ),
              ),
            ],
          ),

        );
        }),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          items: _items,
          onTap: (int index) {
            setState(() {
              _index = index;
              if (index == 0) {
                _body = const Home();
              } else if (index == 1) {
                _body = const Location();
              } else if (index == 2) {
                _body = const Music();
              } else if (index == 3) {
                _body = const Setting();
              }
            });
          },
        ),
      ),
    );
  }
}
