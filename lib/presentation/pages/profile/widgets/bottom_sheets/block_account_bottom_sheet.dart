import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class BlockAccountBottomSheet extends StatelessWidget {
  const BlockAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Tài khoản bị chặn",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyAppColors.white,
                fontSize: SpacingUnit.x6,
                fontWeight: FontWeight.w600),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Không có tài khoản bị chặn nào",
                style: TextStyle(
                    color: MyAppColors.white,
                    fontSize: SpacingUnit.x4_5,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: SpacingUnit.x1_25,
              ),
              Text(
                "Bạn có thể chặn một ai đó từ trang Bạn bè",
                style: TextStyle(
                    color: MyAppColors.hintTextColor,
                    fontSize: SpacingUnit.x4_5,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ))
        ]);
  }
}
