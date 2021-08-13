import 'package:elomelo/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elomelo (এলোমেলো)',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(title: 'HOME'),
    );
  }
}
