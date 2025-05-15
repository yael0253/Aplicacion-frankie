import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/counter_screen.dart';
import 'screens/bienvenida_screen.dart';
import 'screens/name_screen.dart';
import 'screens/calculator_screen.dart';
import 'screens/geolocalizador_screen.dart';
import 'screens/calendar_screen.dart';
import 'widgets/card_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Necesario para inicializar Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  String _userName = '';

  void _updateUserName(String name) {
    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const CounterScreen(),
      BienvenidaScreen(userName: _userName),
      NameScreen(onNameEntered: _updateUserName),
      const CalculatorScreen(),
      const GeolocalizadorScreen(),
      CalendarScreen(),
      const CardScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Contador'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Bienvenida'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculadora'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Geolocalizador'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendario'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Tarjetas'),
        ],
      ),
    );
  }
}
