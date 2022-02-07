import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('First Screen'),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed('/second');
        },
      ),
      
      
    );
  }
}