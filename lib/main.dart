import 'package:flutter/material.dart';
import 'package:image_recognition/app.dart';
import 'package:image_recognition/src/helper/prediction_helper.dart';
import 'package:image_recognition/src/helper/tflite_helper.dart';

import 'src/core/api_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await tfLiteHelpter.loadModel();
  await predictionHelper.loadLabels();

   ApiConfig.initApiEnvironment();

  runApp(ImageRecognitionApp());
}
