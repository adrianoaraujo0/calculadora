import 'package:calculadora/model/button.dart';
import 'package:calculadora/ui/calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor:  Colors.black,
            body: Column(
             children: [ 
                screen(context),
                keyboard(
                  context,
                  [
                    Button(name: "C", color: Colors.white, ),
                    Button(name: "DEL", color: Colors.white, value: "DEL"),
                    Button(color: Colors.white, icon: FontAwesomeIcons.percent, value: "%"),
                    Button(color: Colors.white, icon: FontAwesomeIcons.divide, value: "/"),
                    Button(name: "1", color: Colors.white),
                    Button(name: "2", color: Colors.white),
                    Button(name: "3", color: Colors.white),
                    Button(icon:  FontAwesomeIcons.xmark, color: Colors.white, value: "x"),
                    Button(name: "4", color: Colors.white),
                    Button(name: "5", color: Colors.white),
                    Button(name: "6", color: Colors.white),
                    Button(color: Colors.white, icon: FontAwesomeIcons.minus, value: "-"),
                    Button(name: "7", color: Colors.white),
                    Button(name: "8", color: Colors.white),
                    Button(name: "9", color: Colors.white),
                    Button(color: Colors.white, icon: FontAwesomeIcons.plus, value: "+"),
                    Button(name: "0", color: Colors.white),
                    Button(name: ".", color: Colors.white),
                    Button(name: "ANS", color: Colors.white),
                    Button(color: Colors.white, icon: FontAwesomeIcons.equals, value: "="),
                  ]
                )
              ],
            ),
          ),
        );
      }
    );
  }


  Widget screen(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          darkModeButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(controller.textScreen, style: const TextStyle(color: Colors.white, fontSize: 30)),
            ],
          ),
        ],
      ),
    );
  }

  Widget darkModeButton(){
    return Container(
      height: 50,
      width: 140,
      decoration: BoxDecoration(
        color: const Color.fromARGB(82, 80, 80, 94),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.sunny, color: Colors.white)),
          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.moon, color: Colors.white))
        ],
      ),
    );
  }

  Widget keyboard(BuildContext context, List<Button> buttons){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(82, 80, 80, 94),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child: GridView.builder(
          itemCount: buttons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 17,
            mainAxisSpacing: 25            
          ),
          itemBuilder: (context, index) {
            return buttonInkWell(buttons[index]);
          },
        ),
      ),
    );
  }

  Widget buttonInkWell(Button button){
    return InkWell(
      borderRadius: BorderRadius.circular(23),
      child: buildButton(button),
      onTap: (){
        controller.setTextScreen(button);
      },
    );
  }

  Widget buildButton(Button button){
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color:  Color.fromARGB(82, 50, 50, 63)
      ),
      child: Center(
        child: button.name !=null 
        ? Text(button.name!, style: const TextStyle(color: Colors.white, fontSize: 25))
        : Icon(button.icon, color: Colors.purple)
      ),
    );
  }

}