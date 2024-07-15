import 'package:flutter/material.dart';

import 'home_screen/presentation/pages/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'jop fair summit Route Task',
      home: ProductScreen(),
    );
  }
}
