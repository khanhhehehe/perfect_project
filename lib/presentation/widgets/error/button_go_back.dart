import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/navigation.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonGoBack extends StatelessWidget {
  const ButtonGoBack({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return InkWell(
      onTap: () {
        getIt<AppNavigation>().pop();
      },
      child: Container(
        width: SpacingUnit.x45,
        padding: const EdgeInsets.symmetric(
          vertical: SpacingUnit.x2_5,
          horizontal: SpacingUnit.x4,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(SpacingUnit.x2_5),
          border: Border.all(
            color: const Color(0xFF42558A),
            width: 1,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.iconGoBack,
                width: SpacingUnit.x4_5,
                height: SpacingUnit.x4_5,
              ),
              const SizedBox(width: SpacingUnit.x2),
              Text(
                appLocalizations.errorGoBack,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
