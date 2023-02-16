// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scoreTextController = TextEditingController();

  var alphaScore = '-';

  void calculateScore(BuildContext context) {
    final score = double.parse(scoreTextController.text);
    setState(() {
      if (score >= 90) {
        showSnack(context, 'A');
        alphaScore = 'A';
      } else if (score >= 80) {
        showSnack(context, 'B');
        alphaScore = 'B';
      } else if (score >= 70) {
        showSnack(context, 'C');
        alphaScore = 'C';
      } else if (score >= 60) {
        showSnack(context, 'D');
        alphaScore = 'D';
      } else {
        showSnack(context, 'F');
        alphaScore = 'F';
      }
    });
  }

  void showSnack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grade calculator',
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              // padding: EdgeInsets.all(20),
              child: TextField(
                controller: scoreTextController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  prefixIcon: Icon(Icons.percent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculateScore(context);
              },
              child: Text('Calculate'),
            ),
            Spacer(),
            Text(alphaScore,
                style: TextStyle(
                  color: Color.fromARGB(255, 115, 158, 232),
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                )),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}


// camel case is a property. Amything with () is a widget
