import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
   MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double width = 200;

  double height = 200;
  double radius = 10;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title: Text('Animation Lesson'),),
        body: Center(
          child: AnimatedContainer(
            curve: Curves.slowMiddle,
            duration: Duration(seconds: 2),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(radius))
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.settings),
          onPressed: (){
            setState(() {
              width = width == 300 ? 200 : 300;
              height = height == 300 ? 200 : 300;
              color = color == Colors.blue ? Colors.red : Colors.blue;
              radius = radius == 10 ? 30 : 10;
            });
          },
        ),
      )
    );
  }
}
