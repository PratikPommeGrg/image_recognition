import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

final tfLiteHelpter = TfLiteHelper();

class TfLiteHelper {
  static final TfLiteHelper _instance = TfLiteHelper._internal();

  factory TfLiteHelper() => _instance;

  TfLiteHelper._internal();

  late Interpreter _interpreter;

  //load the model
  Future<Interpreter> loadModel() async {
    _interpreter =
        await Interpreter.fromAsset('assets/models/mobileNet_V2.tflite');

    print('Model input shape: ${_interpreter.getInputTensor(0).shape}');
    print('Model output shape: ${_interpreter.getOutputTensor(0).shape}');

    return _interpreter;
  }

  //preprocess the image
  preprocessImage(File imageFile) {
    //decode the imagefile in image object
    final image = img.decodeImage(imageFile.readAsBytesSync());

    if (image == null) {
      throw Exception('Failed to decode image');
    }

    //resize image to tflite model image requirement of 128x128
    final resizedImage = img.copyResize(image, height: 128, width: 128);

    //Normalize pixel values to [0, 1]
    return List.generate(
      1,
      (index) => List.generate(
          128,
          (x) => List.generate(128, (y) {
                //get pixel value
                final pixel = resizedImage.getPixel(x, y);

                //extract R, G, B values and normalize to [0, 1]
                final r = pixel.r / 255.0;
                final g = pixel.g / 255.0;
                final b = pixel.b / 255.0;

                return [r, g, b];
              })),
    );
  }

  int runInference(input) {
    //define output tensor
    final output = List.filled(1001, 0.0).reshape([1, 1001]);

    //run inference
    _interpreter.run(input, output);

    //flatten the output tensor
    final List<double> probabilites = output[0];

    //get the index of the highest probability
    final topPrediction = probabilites.indexWhere((probablity) =>
        probablity == probabilites.reduce((a, b) => a > b ? a : b));

    return topPrediction;
  }
}
