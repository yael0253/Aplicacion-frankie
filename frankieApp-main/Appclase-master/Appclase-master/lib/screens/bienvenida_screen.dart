import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  final String userName;

  const BienvenidaScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenida'),
      ),
      body: Center(
        child: Text(
          userName.isNotEmpty
              ? '👋 ¡Bienvenido, $userName!'
              : '¡Bienvenido!',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
