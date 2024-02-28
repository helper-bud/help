
import 'package:flutter_all/mvc/app_1/model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CountController extends ControllerMVC{
  // write this manual code. from here :
  factory CountController(){
    if(_this == null) _this = CountController._();
    return _this;
  }
  static CountController _this = CountController._();
  CountController._();
  // end here

  int get counter => Model_Counter.counter;
  void increment(){
    Model_Counter.increment();
  }
  void decrement(){
    Model_Counter.decrement();
  }
}