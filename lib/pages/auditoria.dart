import 'package:flutter/material.dart';
import 'package:laboratorio1/utils/DatabaseHelper.dart';

class AuditoriaScreen extends StatefulWidget {
  @override
  _AuditoriaScreenState createState() => _AuditoriaScreenState();
}

class _AuditoriaScreenState extends State<AuditoriaScreen> {
  late Future<List<Auditoria>> _auditorias;

  @override
  void initState() {
    super.initState();
    _auditorias = DatabaseHelper.getAllAuditorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auditorías')),
      body: FutureBuilder<List<Auditoria>>(
        future: _auditorias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No se encontraron auditorías');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final auditoria = snapshot.data![index];
                return ListTile(
                  title: Text('Acción: ${auditoria.accion}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
