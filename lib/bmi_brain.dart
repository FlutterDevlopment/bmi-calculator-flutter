import 'dart:math';

class BMICalculation {
  BMICalculation({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String bmiResult() {
    _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String bmiText() {
    if (_bmi >= 30.0) {
      return "obese";
    } else if (_bmi >= 25.0) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String bmiInterpretation() {
    if (_bmi > 30.0) {
      return "You have obesity.Try to take control of your body weight.";
    } else if (_bmi >= 25.0) {
      return "You have higher than normal body weight. Try to exercise more.";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight good job.";
    } else {
      return "You have less weight try to eat more.";
    }
  }
}
