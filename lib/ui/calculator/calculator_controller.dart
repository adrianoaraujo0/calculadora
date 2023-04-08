import 'package:calculadora/model/button.dart';
import 'package:mobx/mobx.dart';
part 'calculator_controller.g.dart';

class CalculatorController = _CalculatorControllerBase with _$CalculatorController;

abstract class _CalculatorControllerBase with Store {


  @observable
  String textScreen = "";

  @action
  void setTextScreen(Button button) {
    if(button.name != null ){
      textScreen += button.name!;
    }else{
      textScreen += " ${button.value!} ";
    }
  }

  @action
  void calculate(String operation, ){
    if(operation == "+"){

    }

  }

}