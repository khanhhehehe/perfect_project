import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

Future<T?> showAppModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool? isScrollControlled,
  bool isDismissible = true,
}) {
  return showModalBottomSheet<T>(
    isDismissible: isDismissible,
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(DimensionApp.borderRadius * 4)),
    ),
    isScrollControlled: isScrollControlled ?? true,
    enableDrag: true,
    builder: (BuildContext context) {
      return Container(
          width: DimensionApp.screenWidth,
          padding: EdgeInsets.only(
              top: DimensionApp.verticalPadding,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: DimensionApp.horizontalPadding * 1.2,
              right: DimensionApp.horizontalPadding * 1.2),
          height: DimensionApp.heightBottomSheet,
          decoration: const BoxDecoration(
              color: MyAppColors.backgroundMainColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(DimensionApp.borderRadius * 4),
                  topRight: Radius.circular(DimensionApp.borderRadius * 4))),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: SpacingUnit.x10_5,
                  height: SpacingUnit.x1_5,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.circular(DimensionApp.borderRadius)),
                ),
              ),
              Expanded(child: child)
            ],
          ));
    },
  );
}
