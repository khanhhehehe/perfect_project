import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class ItemUser extends StatelessWidget {
  final String image;
  const ItemUser({super.key, this.image = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SpacingUnit.x10,
      height: SpacingUnit.x10,
      decoration: BoxDecoration(
        border: Border.all(width: SpacingUnit.x0_5, color: MyAppColors.gold),
        borderRadius: BorderRadius.circular(SpacingUnit.x25),
      ),
      padding: const EdgeInsets.all(SpacingUnit.x0_5),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(SpacingUnit.x25),
          child: Image.asset(image)),
    );
  }
}
