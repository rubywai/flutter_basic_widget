import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_floating.dart';

class Home extends StatelessWidget {

   Home({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text('Provider example'),),
      body:  Center(child:  Text('Provider Data is ${context.watch<int>()}')),
      floatingActionButton: BottomFloting(),
    );
  }
}