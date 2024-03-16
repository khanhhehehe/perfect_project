import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
class CircleAvatarWidget extends StatelessWidget {
  final double width;
  final Color? color;
  final double height;
  final double? borderWidth;
  final String path;
  final double?padding;
  const CircleAvatarWidget({super.key, required this.width, required this.height, required this.path, this.color, this.padding, this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color??Colors.yellow, width:borderWidth??3),
      ),
      child: Padding(
        padding:  EdgeInsets.all(padding??4),
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
