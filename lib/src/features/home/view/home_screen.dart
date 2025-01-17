import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/image/image_provider.dart';
import '../view_model/home_screen_view_model.dart';
import 'widgets/camera_view.dart';
import 'widgets/select_image_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeScreenViewProvider);

    homeViewModel.listener(context: context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Recognition",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black.withValues(alpha: 0.8),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            AnimatedContainer(
              height: 50,
              width: 150,
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 1000),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Recognized",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              height: 400,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final imageProviderImageState = ref.watch(
                    imageProvider.select(
                      (value) => value.image,
                    ),
                  );

                  return (imageProviderImageState != null &&
                          imageProviderImageState.path.isNotEmpty)
                      ? Image.file(
                          File(imageProviderImageState.path),
                          fit: BoxFit.cover,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(32),
                          child: cameraView(),
                        );
                },
              ),
            ),
            selectImageButton(context: context, ref: ref),
          ],
        ),
      ),
    );
  }
}
