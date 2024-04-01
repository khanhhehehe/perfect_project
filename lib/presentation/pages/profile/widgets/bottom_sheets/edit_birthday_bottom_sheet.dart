import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/profile/utils/birthday_utils.dart';
import 'package:camera_flutter/presentation/widgets/buttons/button_widget.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class EditBirthday extends StatefulWidget {
  const EditBirthday({super.key});

  @override
  State<EditBirthday> createState() => _EditBirthdayState();
}

class _EditBirthdayState extends State<EditBirthday> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          appLocalizations.pleaseWeKnowYourBirthday,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: SpacingUnit.x6,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(
          height: SpacingUnit.x4,
        ),
        Text(
          appLocalizations.pleaseLetUsKnowSoWeCanCelebrateTogether,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: SpacingUnit.x4,
            color: Colors.grey.withOpacity(0.7),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(
          height: SpacingUnit.x4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PickBirthday(
                items: BirthdayUtils.months,
                title: appLocalizations.month,
                initDate: BirthdayUtils.months.first.toString()),
            const SizedBox(width: SpacingUnit.x3),
            PickBirthday(
                items: BirthdayUtils.date,
                title: appLocalizations.date,
                initDate: BirthdayUtils.date.first.toString()),
          ],
        ),
        const SizedBox(
          height: SpacingUnit.x5,
        ),
        ButtonWidget(title: appLocalizations.continueNext)
      ],
    );
  }
}

class PickBirthday extends StatelessWidget {
  final List<int> items;
  final String title;
  final String initDate;
  const PickBirthday(
      {super.key, this.items = const [], this.title = '', this.initDate = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(SpacingUnit.x4_5)),
      padding: const EdgeInsets.only(
          left: SpacingUnit.x4_5,
          right: SpacingUnit.x2,
          top: SpacingUnit.x1,
          bottom: SpacingUnit.x1),
      child: DropdownButton<String>(
        value: initDate,
        iconSize: 0,
        elevation: 16,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
        underline: const SizedBox(),
        onChanged: (String? value) {},
        dropdownColor: Colors.grey[800],
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(SpacingUnit.x4_5),
        selectedItemBuilder: (context) => items
            .map((e) => Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$title $e',
                    style: const TextStyle(
                        color: MyAppColors.cusorColor,
                        fontWeight: FontWeight.w800,
                        fontSize: SpacingUnit.x4),
                  ),
                ))
            .toList(),
        items: items.map((value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(
              '$title $value',
            ),
          );
        }).toList(),
      ),
    );
  }
}
