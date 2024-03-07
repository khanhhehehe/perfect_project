import 'package:camera/camera.dart';
import 'package:camera_flutter/presentation/pages/home/widgets/preview_camera.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final CameraController controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _takePicture() async {
    if (!widget.controller.value.isInitialized) {
      return;
    }
    if (widget.controller.value.isTakingPicture) {
      return;
    }
    try {
      await widget.controller.setFlashMode(FlashMode.off);
      XFile file = await widget.controller.takePicture();
      print("IMAGE: ${file.name}");
    } on CameraException catch (e) {
      debugPrint("ERROR: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          CameraPreviewHome(controller: widget.controller),
          const Spacer(),
          IconButton(
              onPressed: () => _takePicture(),
              icon: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 58,
                ),
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
