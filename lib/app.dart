import 'package:flutter/material.dart';

class AkelniApp extends StatelessWidget {
  const AkelniApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("hi")),
      ),
    );
  }
}
