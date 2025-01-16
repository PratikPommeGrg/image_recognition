import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_recognition/src/utils/get_file_size.dart';

final imageProvider = StateNotifierProvider<ImageProvider, ImageState>(
    (ref) => ImageProvider(ImageState(), ref));

enum ImageStatus { initial, loading, success, failure }

class ImageState extends Equatable {
  final String? message;
  final ImageStatus? status;
  final XFile? image;

  const ImageState(
      {this.status = ImageStatus.initial, this.message, this.image});

  ImageState copyWith({String? message, ImageStatus? status, XFile? image}) =>
      ImageState(
          message: message ?? this.message,
          status: status ?? this.status,
          image: image ?? this.image);

  @override
  List<Object?> get props => [
        message,
        status,
        image,
      ];
}

class ImageProvider extends StateNotifier<ImageState> {
  ImageProvider(super.state, this.ref);
  final Ref ref;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage({required ImageSource source}) async {
    try {
      state = state.copyWith(
          status: ImageStatus.loading,
          message: "Picking image, please wait...");

      final XFile? image = await _picker.pickImage(source: source);

      if (image != null) {
        //get image size
        final size = getFileSize(File(image.path));

        log("size of image:: $size");

        //check if image size is less than 5MB
        if (size <= 5000000) {
          state = state.copyWith(
              image: image,
              status: ImageStatus.success,
              message: "Image picked successfully");
          log("Selected Image: ${state.image?.path}");
        } else {
          state = state.copyWith(
            message: "Image size should be less than 5mb",
            status: ImageStatus.failure,
            image: XFile(''),
          );
        }
      }
    } catch (e) {
      state = state.copyWith(
        message: e.toString(),
        status: ImageStatus.failure,
        image: XFile(''),
      );
    }
  }
}
