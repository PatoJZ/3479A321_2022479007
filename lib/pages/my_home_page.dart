import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laboratorio1/pages/appdata.dart';
import 'package:laboratorio1/pages/auditpage.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:laboratorio1/pages/detail.dart';
import 'package:laboratorio1/pages/about.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() {
    Logger().d("createState: Estado creado.");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var logger = Logger();
  int _counter = 0;

  /// Load the initial counter value from persistent storage on start,
  /// or fallback to 0 if it doesn't exist.
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  /// After a click, increment the counter state and
  /// asynchronously save it to persistent storage.
  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
    logger.d("initState: El widget fue incluido en el árbol.");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.d("didChangeDependencies: Las dependencias cambiaron.");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.d("didUpdateWidget: El widget ha sido actualizado.");
  }

  @override
  void deactivate() {
    logger.d("deactivate: El widget fue removido del árbol.");
    super.deactivate();
  }

  @override
  void dispose() {
    logger.d("dispose: El widget ha sido eliminado permanentemente.");
    super.dispose();
  }

  @override
  void reassemble() {
    logger.d("reassemble: Hot reload ha sido ejecutado.");
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    var appData = context.watch<AppData>();

    logger.d("build: Construyendo la interfaz de usuario. Mounted: $mounted");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
        centerTitle: true,
      ),
      // Aquí va el Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú de Navegación'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Contador'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Detalle'),
              onTap: () {
                context
                    .read<AppData>()
                    .actions
                    .add("Acceso a la pantalla Detalle");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Detail()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Sobre'),
              onTap: () {
                context
                    .read<AppData>()
                    .actions
                    .add("Acceso a la pantalla Sobre");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Auditoría'),
              onTap: () {
                context
                    .read<AppData>()
                    .actions
                    .add("Acceso a la pantalla Auditoría");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuditPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/8664845_face_grin_tongue_icon.svg",
                            semanticsLabel: 'Icon',
                            width: 80,
                          ),
                          const Text('Pulsaciones:'),
                          Text(
                            '$_counter', // Contador usando el Provider
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appData.counter == 10
                                ? 'Has ganado'
                                : appData.counter == 5
                                    ? 'Has perdido'
                                    : 'Sin ganador',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: _incrementCounter,
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: context.read<AppData>().resetCounter,
                              child: const Icon(Icons.refresh),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed:
                                  context.read<AppData>().subtractCounter,
                              child: const Icon(Icons.exposure_minus_1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
