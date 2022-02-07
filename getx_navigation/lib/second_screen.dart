import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.parameters['name']);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Second Screen'),),

      
    );
  }
}