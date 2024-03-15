import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  const MyAppBar(
      {super.key,
      this.leading,
      this.title = '',
      this.actions,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? MyAppColors.black.withOpacity(0.5),
      child: Row(
        children: [
          leading ?? const SizedBox(),
          Text(title),
          if (actions != null) Row(children: actions!)
        ],
      ),
    );
  }
}
