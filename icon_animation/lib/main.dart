import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title: Text('Fontawesome Lesson'),),
        body: Center(
          child: FaIcon(FontAwesomeIcons.dove,color: Colors.blue,size: 30,)
        ),
        
      )
    );
  }
}