import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  const ButtonWidget({super.key, this.title = '', this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyAppColors.cusorColor,
        fixedSize: Size(DimensionApp.screenWidth, SpacingUnit.x15),
        shadowColor: MyAppColors.cusorColor,
        elevation: 5,
      ),
      onPressed: () => onPress?.call(),
      child: Text(
        title,
        style: const TextStyle(
          color: MyAppColors.black,
          fontSize: SpacingUnit.x4_5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
