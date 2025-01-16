import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_recognition/src/providers/image/image_provider.dart';

final homeScreenViewProvider = Provider((ref) => HomeScreenViewModel(ref));

class HomeScreenViewModel {
  HomeScreenViewModel(this.ref);
  final Ref ref;
  void listener({required BuildContext context}) {
    ref.listen(
      imageProvider,
      (previous, next) {
        log("previous status: ${previous?.status}, next status: ${next.status}");
        if (previous?.status != next.status) {
          if (next.status == ImageStatus.loading) {}
          if (next.status == ImageStatus.failure) {
            log("failure status");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  next.message ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
          }
          if (next.status == ImageStatus.success) {
            log("success status");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  next.message ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      },
    );
  }
}
