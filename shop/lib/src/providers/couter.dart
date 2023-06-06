import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CounterState {
  int _value = 0;

  void incremento() => _value++;
  void decremento() => _value--;
  int get value => _value;

  bool diff(CounterState old){
    return old._value != _value;
  }

}


class CounterProvider extends InheritedWidget {

  final CounterState state = CounterState();
  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }
  
  CounterProvider({ required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }

}