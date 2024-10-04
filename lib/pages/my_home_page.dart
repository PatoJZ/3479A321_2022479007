import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:laboratorio1/pages/detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() {
    Logger().d("createState: estado creado.");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
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

  void _incrementCounter() {
    setState(() {
      _counter++;
      logger.d("setState: Contador incrementado a $_counter.");
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      logger.d("setState: Contador reiniciado a $_counter.");
    });
  }

  void _subtractCounter() {
    setState(() {
      _counter--;
      logger.d("setState: Contador disminuido a $_counter.");
    });
  }

  String _iconText(int counter) {
    String default_ = "sin ganador";
    String win = "has ganado";
    String loss = "has perdido";
    if (counter == 5) {
      return loss;
    } else if (counter == 10) {
      return win;
    } else {
      return default_;
    }
  }

  String _icon(int counter) {
    String default_ = "assets/icons/8664845_face_grin_tongue_icon.svg";
    String win = "assets/icons/7727475_gold_cup_award_success_first_victory_icon.svg";
    String loss = "assets/icons/7631427_status_error_alert_alarm_icon.svg";
    if (counter == 5) {
      return loss;
    } else if (counter == 10) {
      return win;
    } else {
      return default_;
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.d("build: Construyendo la interfaz de usuario.");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
        centerTitle: true,
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
                            _icon(_counter),
                            semanticsLabel: 'Acme Logo',
                            width: 80,
                          ),
                          const Text('Pulsaciones:'),
                          Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _iconText(_counter),
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
                              onPressed: _resetCounter,
                              child: const Icon(Icons.refresh),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: _subtractCounter,
                              child: const Icon(Icons.exposure_minus_1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Detail()),
                      );
                    },
                    child: const Icon(Icons.arrow_forward_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}