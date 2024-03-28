
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/widgets/buttons/button_widget.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:camera_flutter/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ReportProblemBottomSheet extends StatelessWidget {
  final String hintText;
  const ReportProblemBottomSheet({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final FocusNode firstNameFocus = FocusNode();
    final FocusNode lastNameFocus = FocusNode();
    return Stack(
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                appLocalizations.reportProblem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: MyAppColors.white,
                    fontSize: SpacingUnit.x6,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: SpacingUnit.x4,
              ),
              TextField(
                focusNode: firstNameFocus,
                autofocus: true,
                onSubmitted: (_) {
                  lastNameFocus.requestFocus();
                },
                keyboardType: TextInputType.emailAddress,
                style: TextThemeStyleApp.inputTextColor,
                cursorColor: MyAppColors.cusorColor,
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Your email address",
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
                height: SpacingUnit.x4,
              ),
              TextFormField(
                focusNode: lastNameFocus,
                minLines: 6,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
                style: TextThemeStyleApp.inputTextColor,
                cursorColor: MyAppColors.cusorColor,
                decoration: InputDecoration(
                  filled: true,
                  hintText: hintText,
                  fillColor: MyAppColors.inputBackground,
                  hintStyle: const TextStyle(
                    color: MyAppColors.hintTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(
                      DimensionApp.borderRadius * SpacingUnit.x0_5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                ),
              ),
            ]),
        const Positioned(
            left: 0,
            right: 0,
            bottom: SpacingUnit.x5,
            child: ButtonWidget(title: "Gửi")),
      ],
    );
  }
}
