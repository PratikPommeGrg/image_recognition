import 'package:flutter/material.dart';
import 'package:image_recognition/app.dart';
import 'package:image_recognition/src/helper/tf_lite_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await tfLiteHelpter.loadModel();

  runApp(ImageRecognitionApp());
}
