import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas Marvel'),
      ),
      body: ListView(
        children: [
          _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ODVCmPaAdg7wKlIdmQPwT1qPjMYYEuUjRw&s', 'Spider-Man', 'Hola Spidey!!!!!'),
          _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_VjcIEe5aphXG5B1Srx2LBaKpDd6XuyVx_A&s', 'Iron Man', 'Hola Stark!!!!'),
          _buildCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO2EZ4BHLGHvhLmR5h3xgREBjXpBHLW2rfLA&s', 'Black Widow', 'Hola Natasha!!!!'),
        ],
      ),
    );
  }

  // Método para crear las tarjetas con imagen y texto
  Widget _buildCard(String imageUrl, String title, String description) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.network(
          imageUrl,
          height: 200, // Altura fija para todas las imágenes
          width: double.infinity, // Ancho que ocupe todo el espacio disponible
          fit: BoxFit.cover, // Asegura que la imagen cubra el espacio sin distorsionarse
        ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0), // Corregido
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
