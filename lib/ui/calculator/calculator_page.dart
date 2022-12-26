import 'package:calculadora/model/button.dart';
import 'package:calculadora/ui/calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          StreamBuilder<List<String>>(
            stream: calculatorController.controllerScreen.stream,
            builder: (context, snapshot) {
              return SizedBox(
                height: 150,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(
                      //   snapshot.data ?? "",
                      //   style: const TextStyle(color: Colors.white, fontSize: 55),
                      // )
                    ]
                  ),
                ),
              );
            }
          ),
         buildKeyboard(
            [
              Button(name: "AC", operation: calculatorController.clearAll, color: Colors.blueAccent),
              Button(name: "(  )", color: Colors.blueAccent),
              Button(name: "%", color: Colors.blueAccent),
              Button(icon: FontAwesomeIcons.divide, color: Colors.red[200]!),
              Button(name: "9", color: Colors.white),
              Button(name: "8", color: Colors.white),
              Button(name: "7", color: Colors.white),
              Button(icon: FontAwesomeIcons.xmark, color: Colors.red[200]!),
              Button(name: "6", color: Colors.white),
              Button(name: "5", color: Colors.white),
              Button(name: "4", color: Colors.white),
              Button(icon: FontAwesomeIcons.minus, color: Colors.red[200]!),
              Button(name: "3", color: Colors.white),
              Button(name: "2", color: Colors.white),
              Button(name: "1", color: Colors.white),
              Button(icon: FontAwesomeIcons.plus , color: Colors.red[200]!),
              Button(icon: FontAwesomeIcons.deleteLeft, color: Colors.white),
              Button(name: "0", color: Colors.white),
              Button(name: ".", color: Colors.white),
              Button(icon: FontAwesomeIcons.equals, color: Colors.white),
            ]
          )
        ],
      ),
    );
  }

  buildKeyboard(List<Button> buttons){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40), bottom: Radius.circular(0)),
          color:  Color.fromARGB(82, 80, 80, 94),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 17,
            mainAxisSpacing: 25            
          ),
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            return buildButton(button: buttons[index]);
          },
        ),
      ),
    );
  }

  buildButton({required Button button}){
    return InkWell(
      onTap: () {
        if(button.operation == null){
          print("1");
          calculatorController.controllers[0].text += button.name!;
          // calculatorController.controllerScreen.sink.add(calculatorController.controllers[0].text);
        }else{
          print("2");
          button.operation!();
        }
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(82, 50, 50, 63)
        ),
        child: Center(
          child: button.name != null 
          ? Text(button.name!, style: TextStyle(color: button.color, fontSize: 25))
          : Icon(button.icon, size: 23, color: button.color)
        )
      )
    );
  }
}