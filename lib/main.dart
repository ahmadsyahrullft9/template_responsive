import 'package:flutter/material.dart';
import 'package:responsive_demo/homepage.dart';

void main() {
  runApp(const Responsiveness());
}

class Responsiveness extends StatelessWidget {
  const Responsiveness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Responsiveness",
      home: HomePage(),
    );
  }
}
