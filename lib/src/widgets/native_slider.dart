import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeSlider extends StatelessWidget {
  const NativeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: 'native-slider',
      onPlatformViewCreated: (id) {
        final methodChannel = MethodChannel('native-slider/$id');
        methodChannel.setMethodCallHandler((call) async {
          if (call.method == 'onValueChanged') {
            print('Slider value: ${call.arguments}');
          }
        });
      },
    );
  }
}
