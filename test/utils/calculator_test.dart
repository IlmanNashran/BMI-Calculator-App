import 'package:bmi_app/utils/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Give height and weight When calculateBMI function invoked Then correct BMI return ',
      () {
    //Arrange
    const int height = 170, weight = 70;
    //act     -- act apon our test
    double bmi = calculateBMI(height, weight);
    //Assert  -- checkoutput
    expect(bmi, 24.221453287197235);
  });



}


