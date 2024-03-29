import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/presentation/widgets/buttons/button_widget.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:camera_flutter/themes/text_theme.dart';
import 'package:flutter/material.dart';

// final style =
class EditNameBottomSheet extends StatelessWidget {
  const EditNameBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode firstNameFocus = FocusNode();
    final FocusNode lastNameFocus = FocusNode();

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Sửa tên của bạn",
              style: TextStyle(
                fontSize: SpacingUnit.x6_25,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(
              height: SpacingUnit.x10,
            ),
            TextField(
              focusNode: firstNameFocus,
              style: TextThemeStyleApp.inputTextColor,
              onSubmitted: (_) {
                lastNameFocus.requestFocus();
              },
              autofocus: true,
              cursorColor: MyAppColors.cusorColor,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Tên",
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
            TextField(
              focusNode: lastNameFocus,
              onSubmitted: (_) {},
              autofocus: true,
              cursorColor: MyAppColors.cusorColor,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Họ",
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
          ],
        ),
        const Positioned(
            left: 0,
            right: 0,
            bottom: SpacingUnit.x5,
            child: ButtonWidget(title: "Lưu")),
      ],
    );
  }
}
