import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = (_counter - 1).clamp(0, double.infinity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador"),
        backgroundColor: Theme.of(context).colorScheme.tertiaryFixed,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Has presionado el botón esta cantidad de veces:',
              style: Theme.of(context).textTheme.displayLarge, // Cambio aquí
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50 + _counter * 10,
              width: 50 + _counter * 10,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/8768/8768984.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium, // Cambio aquí
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.emoji_emotions),
      ),
    );
  }
}
