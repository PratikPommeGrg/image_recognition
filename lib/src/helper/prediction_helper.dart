import 'package:flutter/services.dart';

final predictionHelper = PredictionHelper();

class PredictionHelper {
  static final PredictionHelper _instance = PredictionHelper._internal();

  factory PredictionHelper() => _instance;

  PredictionHelper._internal();

  late List<String> labels;

  // load labels and get labels class name
  Future<void> loadLabels() async {
    String loadedLabelsFile =
        await rootBundle.loadString('assets/models/labels.csv');
    //split the file into lines
    final List<String> lines = loadedLabelsFile.split('\n');

    //filter out label name
    labels = lines.map((e) => e.split(',')[1]).toList();

    print("labels lenght :: ${labels.length}");
  }

  //get prediction label of image recognition
  String prediction(int index) {
    print("index :: $index");
    if (index < 0 || index >= labels.length) {
      return "Unknown";
    }
    return labels[index];
  }
}
