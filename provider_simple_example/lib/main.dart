import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_example/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Provider(
          create: (_) => 1000,
          child: Home(),
        )
    );
  }
}