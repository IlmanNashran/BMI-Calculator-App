import 'dart:math';

double calculateBMI(int height, int weight) {
  double _heightInMeters = height / 100; // Convert centimeters to meters
  return weight / (_heightInMeters * _heightInMeters);
}

