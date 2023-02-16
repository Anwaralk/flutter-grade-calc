import 'package:flutter/material.dart';
import 'package:flutter_grade_calc_ui/home_screen.dart';

void main() {
  runApp(const GradeCalculator());
}

class GradeCalculator extends StatelessWidget {
  const GradeCalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
