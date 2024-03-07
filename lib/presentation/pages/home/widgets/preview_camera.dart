import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewHome extends StatelessWidget {
  final CameraController controller;
  const CameraPreviewHome({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).width * 0.9,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: const Color(0xFF4A7CE2)),
          borderRadius: BorderRadius.circular(40),
          color: const Color(0xFF64B5F6),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CameraPreview(controller)));
  }
}
