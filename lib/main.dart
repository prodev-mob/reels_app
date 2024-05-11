import 'package:flutter/material.dart';
import 'package:untitled/reels/screens/reels_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reels Viewer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReelsScreen(),
    );
  }
}
