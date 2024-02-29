import 'package:flutter/cupertino.dart';

// can be taken as model class
class CounterProvider with ChangeNotifier{
  int count = 0;
  void increament(){
    count++;
    notifyListeners();
  }

  void decrement(){
    count--;
    notifyListeners();
  }
}