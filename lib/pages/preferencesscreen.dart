import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _userName = '';
  int _counter = 0;


  @override
  void initState() {
    super.initState();
  }
   Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'Invitado';
      _counter = prefs.getInt('counter') ?? 0;
    });
   
  }
   Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setInt('counter', _counter);
    // Este logger ayudará a verificar que las preferencias se están guardando.
    print("Preferencias guardadas: userName: $_userName, counter: $_counter");
  }


  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
    _savePreferences();
  }

  void _updateCounter(int newCounter) {
    setState(() {
      _counter = newCounter;
    });
    _savePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter your name:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              initialValue: _userName,
              decoration: const InputDecoration(
                hintText: 'Your name',
              ),
              onChanged: (value) {
                _updateUserName(value);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Adjust Counter Value:',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _counter.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: _counter.toString(),
              onChanged: (value) {
                _updateCounter(value.toInt());
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Current Counter: $_counter',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
