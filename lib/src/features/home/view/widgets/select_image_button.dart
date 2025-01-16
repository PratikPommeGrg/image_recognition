import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/custom_image_picker_bottomsheet.dart';

Widget selectImageButton(
    {required BuildContext context, required WidgetRef ref}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.teal),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
    onPressed: () {
      customImagePickerBottomSheet(context: context, ref: ref);
    },
    child: Text(
      "Select Image",
      style: TextStyle(fontSize: 16),
    ),
  );
}
