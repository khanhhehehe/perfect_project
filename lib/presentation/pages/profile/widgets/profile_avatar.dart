import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final bool showAvatar;
  final double opacity;
  const ProfileAvatar({super.key, this.showAvatar = false, this.opacity = 0});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: showAvatar ? 1 : 1 - opacity,
      child: Column(
        children: [
          GestureDetector(
              onTap: () {},
              child:
                  const CircleAvatarWidget(width: 150, height: 150, path: '')),
          const SizedBox(height: SpacingUnit.x2_25),
          const Text(
            "Khanh an buoi",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
