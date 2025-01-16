import 'dart:io';

int getFileSize(File? file) {
  return file?.lengthSync() ?? 0;
}
