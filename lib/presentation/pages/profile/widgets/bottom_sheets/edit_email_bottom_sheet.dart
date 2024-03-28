import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/presentation/widgets/buttons/button_widget.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:camera_flutter/themes/text_theme.dart';
import 'package:flutter/material.dart';

class EditEmailBottomSheet extends StatelessWidget {
  const EditEmailBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Điền mật khẩu của bạn",
              style: TextStyle(
                fontSize: SpacingUnit.x6_25,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(
              height: SpacingUnit.x4,
            ),
            TextField(
              autofocus: true,
              obscureText: true,
              style: TextThemeStyleApp.inputTextColor,
              cursorColor: MyAppColors.cusorColor,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Mật khẩu",
                  fillColor: MyAppColors.inputBackground,
                  hintStyle: const TextStyle(
                      color: MyAppColors.hintTextColor,
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        DimensionApp.borderRadius * SpacingUnit.x0_5,
                      ))),
            ),
            const SizedBox(
              height: SpacingUnit.x5,
            ),
          ],
        ),
        const Positioned(
            left: 0,
            right: 0,
            bottom: SpacingUnit.x5,
            child: ButtonWidget(title: "Tiếp tục")),
      ],
    );
  }
}
