import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
class CircleAvatarWidget extends StatelessWidget {
  final double width;
  final double height;
  final String path;
  const CircleAvatarWidget({super.key, required this.width, required this.height, required this.path});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.yellow, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(width/2),
            child: Image.asset(
            path.isEmpty?Assets.images.sunny.path:path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
