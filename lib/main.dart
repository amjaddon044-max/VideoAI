import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VideoAIApp());
}

class VideoAIApp extends StatelessWidget {
  const VideoAIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VideoAI - AI Video Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
