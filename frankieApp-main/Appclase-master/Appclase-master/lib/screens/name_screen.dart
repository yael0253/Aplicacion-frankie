import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
  final Function(String) onNameEntered;

  const NameScreen({super.key, required this.onNameEntered});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingrese su nombre'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Cuál es tu nombre?'),
              const SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  widget.onNameEntered(_controller.text);
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
