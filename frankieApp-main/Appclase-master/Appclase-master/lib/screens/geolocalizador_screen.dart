import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocalizadorScreen extends StatefulWidget {
  const GeolocalizadorScreen({super.key});

  @override
  _GeolocalizadorScreenState createState() => _GeolocalizadorScreenState();
}

class _GeolocalizadorScreenState extends State<GeolocalizadorScreen> {
  String _ubicacion = 'Cargando ubicación...';

  @override
  void initState() {
    super.initState();
    _obtenerUbicacion();
  }

  // Función para obtener la ubicación
  Future<void> _obtenerUbicacion() async {
    try {
      Position posicion = await _obtenerUbicacionUsuario();
      setState(() {
        _ubicacion = 'Latitud: ${posicion.latitude}, Longitud: ${posicion.longitude}';
      });
    } catch (e) {
      setState(() {
        _ubicacion = 'Error al obtener ubicación: $e';
      });
    }
  }

  // Función separada que obtiene la ubicación del usuario
  Future<Position> _obtenerUbicacionUsuario() async {
    bool servicioHabilitado = await Geolocator.isLocationServiceEnabled();
    if (!servicioHabilitado) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    LocationPermission permiso = await Geolocator.checkPermission();
    if (permiso == LocationPermission.denied) {
      permiso = await Geolocator.requestPermission();
      if (permiso == LocationPermission.denied) {
        return Future.error('Permiso de ubicación denegado.');
      }
    }

    if (permiso == LocationPermission.deniedForever) {
      return Future.error('Permiso de ubicación permanentemente denegado.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Center(
        child: Text(
          _ubicacion,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
