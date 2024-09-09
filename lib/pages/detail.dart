import 'package:flutter/material.dart';
import 'package:laboratorio1/pages/about.dart';
import 'package:laboratorio1/pages/my_home_page.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true ,
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
                      'detail:',
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
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(title: "")),
                      );
                    },
                    child: const Icon(Icons.arrow_back_outlined),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const About()),
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
