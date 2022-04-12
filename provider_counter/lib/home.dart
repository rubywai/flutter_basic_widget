import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/counter_notifier.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterNotifier>(
              builder: (context,counterNotifier,_){
                return Text('My Number is ${counterNotifier.number}',style: TextStyle(fontSize: 25),);
              },
            ),
          ),
          Divider(),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  Provider.of<CounterNotifier>(context,listen: false).increment();
                }, icon: Icon(Icons.add)),
                IconButton(onPressed: (){
                  Provider.of<CounterNotifier>(context,listen: false).decrement();
                }, icon: Icon(Icons.remove))
              ],
            ),
          )
        ],
      ),
      
    );
  }
}