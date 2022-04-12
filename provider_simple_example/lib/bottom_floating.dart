import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomFloting extends StatelessWidget {
  const BottomFloting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
       child: Text('Provider ${context.watch<int>()}'),
    );
  }
}