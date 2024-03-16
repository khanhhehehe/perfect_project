import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemSetting extends StatelessWidget {
  final IconData? iconData;
  final double? opacityWidget;
  final String title;
  final bool? isUsingSvgFile;
  final double? padding;
  final String? pathSvg;
  final List<Widget> child;

  const ItemSetting({
    Key? key,
     this.iconData,
    required this.title,
    required this.child,
    this.isUsingSvgFile,
    this.pathSvg, this.opacityWidget, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimens.verticalPadding * 1.2),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
      width: Dimens.screenWidth,
      child: Column(
        children: [
          Row(
            children: [
              isUsingSvgFile == true && pathSvg != null
                  ? SvgPicture.asset(
                      pathSvg!,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: SpacingUnit.x8,
                      height: SpacingUnit.x8,
                    )
                  : Icon(
                      iconData,
                      size: 26,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    SizedBox(width: SpacingUnit.x1,),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                ),
              )
            ],
          ),
          const SizedBox(height: SpacingUnit.x1_5),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: padding??Dimens.horizontalPadding),
            width: Dimens.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.borderRadius * 2.8),
              color: Colors.white.withOpacity(opacityWidget??0.3),
            ),
            child: Column(
              children: child,
            ),
          )
        ],
      ),
    );
  }
}
