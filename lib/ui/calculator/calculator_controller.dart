import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class CalculatorController{

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  BehaviorSubject<List<String>> controllerScreen = BehaviorSubject<List<String>>();

  double sum(double value1, double value2) => value1 + value2;
  
  void clearAll(){
    controllers[0].clear();
    controllers[1].clear();
    controllerScreen.sink.add(
      [
        controllers[0].text,
        controllers[1].text,
        controllers[2].text,
       ]
    );
  }

}