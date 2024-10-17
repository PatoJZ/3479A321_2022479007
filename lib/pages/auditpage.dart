import 'package:flutter/material.dart';
import 'package:laboratorio1/pages/appdata.dart';
import 'package:provider/provider.dart';

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
