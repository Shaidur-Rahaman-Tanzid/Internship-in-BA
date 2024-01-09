import 'package:flutter/material.dart';

import 'HomeScreen.dart';
void main()=> runApp(ba_training());
class ba_training extends StatelessWidget {
  const ba_training({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Automation Training',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
