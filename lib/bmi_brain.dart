import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'main.dart';

class BmiBrain {
  int height;
  int weight;
  double _bmi;

  BmiBrain({@required this.height, @required this.weight});

  String bmiCal() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiTitle() {
    if (_bmi >= 18.5 && _bmi <= 25) {
      return 'normal';
    } else if (_bmi > 25 && _bmi <= 30) {
      return 'overweight';
    } else if (_bmi > 30) {
      return 'obese';
    } else {
      return 'underweight';
    }
  }

  String bmiComments() {
    if (_bmi >= 18.5 && _bmi <= 25) {
      return 'Well done! You are doing great.';
    } else if (_bmi > 25 && _bmi <= 30) {
      return 'Keep workout! You need to lose some.';
    } else if (_bmi > 30) {
      return 'Work Harder! You need to lose so much.';
    } else {
      return 'Eat well! You need to gain.';
    }
  }
}
