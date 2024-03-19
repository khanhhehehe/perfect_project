import 'package:camera_flutter/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class FriendBottomSheet extends StatelessWidget {
  const FriendBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22),
            children: const <TextSpan>[
              TextSpan(
                  text: '${10} / 20 ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24)),
              TextSpan(
                  text: ' người bạn',
                  style: TextStyle(
                      fontFamily: FontFamily.sFCompact,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        )
      ],
    );
  }
}
