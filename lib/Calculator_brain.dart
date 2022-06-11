import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculate_BMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 15) {
      return 'Normal';
    } else {
      return 'Bad Shereded Ass';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'you should stop eating like a cow and you\'re gonna be better';
    } else if (_bmi > 15) {
      return 'you\'re a basic person you should consider 1 hour a day workingout';
    } else {
      return 'Bad Shereded Ass';
    }
  }
}
