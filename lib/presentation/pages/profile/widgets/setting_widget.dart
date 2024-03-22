import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_widget.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  final VoidCallback? onPressFirst;
  final VoidCallback? onPressSecond;
  const SettingWidget({super.key, this.onPressFirst, this.onPressSecond});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ItemWidget(
            callback: () => onPressFirst?.call(),
            isTutorial: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -30,
                      top: 5,
                      child: CircleAvatarWidget(
                          padding: 0.8, width: 40, height: 40, path: ''),
                    ),
                    Positioned(
                      left: 30,
                      top: 5,
                      child: CircleAvatarWidget(
                          padding: 0.8, width: 48, height: 40, path: ''),
                    ),
                    CircleAvatarWidget(
                        padding: 0.8, width: 50, height: 50, path: ''),
                  ],
                ),
                const SizedBox(
                  height: SpacingUnit.x1,
                ),
                Text(
                  appLocalizations.everyone,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3),
                )
              ],
            )),
        ItemWidget(
          callback: () => onPressSecond?.call(),
          isTutorial: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 3),
                    borderRadius:
                        BorderRadius.circular(DimensionApp.borderRadius * 5)),
                child: Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.yellow.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(
                            DimensionApp.borderRadius * 5)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28,
                    )),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(vertical: 3),
                width: DimensionApp.screenWidth,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft:
                          Radius.circular(DimensionApp.borderRadius * 1.8),
                      bottomRight:
                          Radius.circular(DimensionApp.borderRadius * 1.8),
                      topLeft: Radius.circular(DimensionApp.borderRadius * 0.8),
                      topRight:
                          Radius.circular(DimensionApp.borderRadius * 0.8),
                    ),
                    color: Colors.grey.withOpacity(0.4)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    appLocalizations.create,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
