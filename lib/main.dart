import 'package:flutter/material.dart';
import 'package:sustainHill/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sustain Hill',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        
      ),
      home:Home(),
    );
  }
}

