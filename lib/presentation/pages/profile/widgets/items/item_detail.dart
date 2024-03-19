import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemDetail extends StatelessWidget {
  final bool? isUsingSvgFile;
  final IconData? iconData;
  final String? pathSvg;
  final String title;
  final VoidCallback onTap;
  const ItemDetail({
    Key? key,
    required this.title,
    this.isUsingSvgFile,
    this.iconData,
    this.pathSvg,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding:
            const EdgeInsets.symmetric(horizontal: DimensionApp.horizontalPadding),
        width: DimensionApp.screenWidth,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: DimensionApp.verticalPadding * 0.8),
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(DimensionApp.verticalPadding * 0.95),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DimensionApp.borderRadius * 5),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: isUsingSvgFile == true && pathSvg != null
                  ? SvgPicture.asset(
                      pathSvg!,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      width: SpacingUnit.x8,
                      height: SpacingUnit.x8,
                    )
                  : Icon(
                      iconData,
                      size: 26,
                      color: Colors.white.withOpacity(0.9),
                    ),
            ),
            const SizedBox(width: SpacingUnit.x2_5),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
