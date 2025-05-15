import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0"; // Resultado de la operación
  String _input = "";   // Entrada de la expresión

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = ""; // Limpiar la entrada
        _output = "0"; // Resetear el resultado
      } else if (buttonText == "=") {
        _output = _evaluateExpression(_input); // Evaluar la expresión
        _input = ""; // Limpiar la entrada después de la evaluación
      } else {
        if (_output != "0" && _input.isEmpty) {
          // Si el resultado es mostrado y la entrada está vacía, comienza una nueva operación
          _input = buttonText;
        } else {
          _input += buttonText; // Agregar el texto del botón a la entrada
        }
        _output = _input; // Mostrar lo que el usuario ha ingresado
      }
    });
  }

  // Evaluar la expresión matemática
  String _evaluateExpression(String expression) {
    // Reemplazamos los operadores '×' y '÷' por '*' y '/' respectivamente
    expression = expression.replaceAll('×', '*').replaceAll('÷', '/');

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression); // Parsear la expresión
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm); // Evaluar la expresión
      return eval.toString(); // Retornar el resultado
    } catch (e) {
      return "Error"; // En caso de error, mostrar "Error"
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 16,
              itemBuilder: (context, index) {
                final buttons = [
                  "7", "8", "9", "÷",
                  "4", "5", "6", "×",
                  "1", "2", "3", "-",
                  "C", "0", "=", "+",
                ];
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () => _buttonPressed(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: const TextStyle(fontSize: 28),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
