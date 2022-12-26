import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Button{

  String? name;
  IconData? icon;
  Function? operation;
  Color color;

  Button({this.name, this.icon, this.operation,required this.color});

}