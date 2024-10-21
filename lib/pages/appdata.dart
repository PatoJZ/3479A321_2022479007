import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  late String _userName;
  List<String> _actions = [];

  int get counter => _counter;
  String get username => _userName;
  List<String> get actions => _actions;

  void incrementCounter() {
    _counter++;
    _actions.add("Incrementó el contador a $_counter");
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    _actions.add("Reinició el contador");
    notifyListeners();
  }

  void subtractCounter() {
    _counter--;
    _actions.add("Disminuyó el contador a $_counter");
    notifyListeners();
  }

}

void setState(Null Function() param0) {}
