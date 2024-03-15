import 'package:camera/camera.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/home/widgets/preview_camera.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakePicture extends StatefulWidget {
  final CameraController controller;
  const TakePicture({super.key, required this.controller});

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  Future<void> _takePicture() async {
    if (!widget.controller.value.isInitialized) {
      return;
    }
    if (widget.controller.value.isTakingPicture) {
      return;
    }
    try {
      await widget.controller.setFlashMode(FlashMode.off);
      XFile file = await widget.controller.takePicture();
      print("IMAGE: ${file.name}");
    } on CameraException catch (e) {
      debugPrint("ERROR: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Column(
      children: [
        const Spacer(),
        CameraPreviewHome(controller: widget.controller),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.images.image,
                  width: SpacingUnit.x8,
                  height: SpacingUnit.x8,
                )),
            IconButton(
              onPressed: () => _takePicture(),
              icon: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: MyAppColors.gold),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: SpacingUnit.x20,
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.images.reload,
                  width: SpacingUnit.x8,
                  height: SpacingUnit.x8,
                )),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Container(
                padding: const EdgeInsets.all(SpacingUnit.x2),
                height: SpacingUnit.x12_5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(SpacingUnit.x2),
                        child: Image.asset(Assets.images.sunny.path)),
                    const SizedBox(width: SpacingUnit.x2),
                    Text(
                      appLocalizations.history,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
            SvgPicture.asset(Assets.images.arrowDown)
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
