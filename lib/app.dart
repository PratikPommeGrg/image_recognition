import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_recognition/src/features/home/view/home_screen.dart';

class ImageRecognitionApp extends StatelessWidget {
  const ImageRecognitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope
    (
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
