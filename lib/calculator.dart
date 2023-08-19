import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        try {
          _input = _evaluateExpression();
        } catch (e) {
          _input = 'Error';
        }
      } else if (value == 'C') {
        _input = '';
      } else if (value == '<') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else {
        _input += value;
      }
    });
  }

  String _evaluateExpression() {
    Parser parser = Parser();
    Expression expression = parser.parse(_input);
    ContextModel contextModel = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, contextModel);

    return result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
  }

  double _radians(double degrees) {
    return degrees * (math.pi / 180);
  }

  Widget _buildButton(String label, {Color color = Colors.white}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/images/logo-removebg-preview.png',
              width: 100,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _input,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const Divider(height: 1),
          Column(
            children: [
              Row(
                children: [
                  _buildButton('(', color: Colors.white),
                  _buildButton(')', color: Colors.white),
                  _buildButton('^', color: Colors.white),
                  _buildButton('<', color: Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton('sin', color: Colors.white),
                  _buildButton('cos', color: Colors.white),
                  _buildButton('tan', color: Colors.white),
                  _buildButton('%', color: Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton('7', color: Colors.white),
                  _buildButton('8', color: Colors.white),
                  _buildButton('9', color: Colors.white),
                  _buildButton('/', color: Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton('4', color: Colors.white),
                  _buildButton('5', color: Colors.white),
                  _buildButton('6', color: Colors.white),
                  _buildButton('*', color: Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton('1', color: Colors.white),
                  _buildButton('2', color: Colors.white),
                  _buildButton('3', color: Colors.white),
                  _buildButton('-', color: Colors.white),
                ],
              ),
              Row(
                children: [
                  _buildButton('C', color: Colors.white),
                  _buildButton('0', color: Colors.white),
                  _buildButton('=', color: Colors.white),
                  _buildButton('+', color: Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
