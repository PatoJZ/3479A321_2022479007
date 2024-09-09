import 'package:flutter/material.dart';
import 'package:laboratorio1/pages/detail.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Card(
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.info),
                    Text(
                      'About:',
                      style: TextStyle(
                        fontSize: 24, // Tamaño de fuente en píxeles
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => const Detail()),
                      );
                    },
                    child: const Icon(Icons.arrow_back_outlined),
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
