import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_recognition/src/providers/image/image_provider.dart';

customImagePickerBottomSheet(
    {required BuildContext context, required WidgetRef ref}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Take Photo"),
              leading: Icon(Icons.camera_alt),
              onTap: () {
                Navigator.pop(context);
                ref
                    .read(imageProvider.notifier)
                    .pickImage(source: ImageSource.camera);
              },
            ),
            ListTile(
              title: Text("Pick from Gallery"),
              leading: Icon(Icons.image),
              onTap: () {
                Navigator.pop(context);
                ref
                    .read(imageProvider.notifier)
                    .pickImage(source: ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    },
  );
}
