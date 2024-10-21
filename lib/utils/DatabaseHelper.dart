import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Auditoria {
  final int id;
  final String accion;

  Auditoria({required this.id, required this.accion});

  Map<String, dynamic> toMap() {
    return {'id': id, 'accion': accion};
  }

  static Auditoria fromMap(Map<String, dynamic> map) {
    return Auditoria(
      id: map['id'],
      accion: map['accion'],
    );
  }

}

class DatabaseHelper {
  
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'auditoria.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE auditorias(id INTEGER PRIMARY KEY, accion TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertAuditoria(Auditoria auditoria) async {
    final db = await getDatabase();
    await db.insert('auditorias', auditoria.toMap());
  }

  static Future<List<Auditoria>> getAllAuditorias() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('auditorias');
    return List.generate(maps.length, (i) {
      return Auditoria.fromMap(maps[i]);
    });
  }
}