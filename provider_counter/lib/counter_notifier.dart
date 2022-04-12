
import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier{
  int number = 0;
  
  void increment(){
    number ++;
    notifyListeners();
  }

  void decrement(){
    if(number > 0){
    number --;
    notifyListeners();
    }
  }

}