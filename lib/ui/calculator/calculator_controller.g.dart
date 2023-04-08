// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculatorController on _CalculatorControllerBase, Store {
  late final _$textScreenAtom =
      Atom(name: '_CalculatorControllerBase.textScreen', context: context);

  @override
  String get textScreen {
    _$textScreenAtom.reportRead();
    return super.textScreen;
  }

  @override
  set textScreen(String value) {
    _$textScreenAtom.reportWrite(value, super.textScreen, () {
      super.textScreen = value;
    });
  }

  late final _$_CalculatorControllerBaseActionController =
      ActionController(name: '_CalculatorControllerBase', context: context);

  @override
  void setTextScreen(Button button) {
    final _$actionInfo = _$_CalculatorControllerBaseActionController
        .startAction(name: '_CalculatorControllerBase.setTextScreen');
    try {
      return super.setTextScreen(button);
    } finally {
      _$_CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculate(String operation) {
    final _$actionInfo = _$_CalculatorControllerBaseActionController
        .startAction(name: '_CalculatorControllerBase.calculate');
    try {
      return super.calculate(operation);
    } finally {
      _$_CalculatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textScreen: ${textScreen}
    ''';
  }
}
