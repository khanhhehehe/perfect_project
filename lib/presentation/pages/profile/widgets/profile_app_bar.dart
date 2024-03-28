import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:camera_flutter/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  final String username;
  final String avatar;
  const ProfileAppBar({super.key, this.avatar = '', this.username = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatarWidget(
          width: SpacingUnit.x12_5,
          height: SpacingUnit.x12_5,
          path: avatar,
          color: MyAppColors.transparent,
        ),
        const SizedBox(
          width: SpacingUnit.x1,
        ),
        Text(
          username,
          style: TextThemeStyleApp.large500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
