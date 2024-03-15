import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemMessage extends StatelessWidget {
  const ItemMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: Dimens.horizontalPadding),
      width: Dimens.screenWidth,
      height: 80,
      margin: const EdgeInsetsDirectional.symmetric(
          vertical: Dimens.verticalPadding * 0.6),
      child: GestureDetector(
        onTap: () {
          print("cac");
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatarWidget(width: 80, height: 80, path: ''),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Khanh an buoi",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "20h",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "dit me may",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 38,
            ),
          ],
        ),
      ),
    );
  }
}
