import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/input_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColour,
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
        ),
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: Icons.fitness_center,
            nextScreen: InputPage(),
            splashIconSize: 100,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blueGrey));
  }
}
