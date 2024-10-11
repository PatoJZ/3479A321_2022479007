import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> _actions = [];

  int get counter => _counter;
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

class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = context.watch<AppData>().actions; 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Auditoría"),
      ),
      body: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(actions[index]),
          );
        },
      ),
    );
  }
}
