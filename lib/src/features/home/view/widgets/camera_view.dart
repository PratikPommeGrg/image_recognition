import 'package:flutter/material.dart';

Widget cameraView() {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      // Top Left Corner
      Positioned(
        top: 0,
        left: 0,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.white, width: 4),
              left: BorderSide(color: Colors.white, width: 4),
            ),
          ),
        ),
      ),
      // Top Right Corner
      Positioned(
        top: 0,
        right: 0,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.white, width: 4),
              right: BorderSide(color: Colors.white, width: 4),
            ),
          ),
        ),
      ),
      // Bottom Left Corner
      Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white, width: 4),
              left: BorderSide(color: Colors.white, width: 4),
            ),
          ),
        ),
      ),
      // Bottom Right Corner
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.white, width: 4),
              right: BorderSide(color: Colors.white, width: 4),
            ),
          ),
        ),
      ),

      Text(
        "Select Image",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      )
    ],
  );
}
