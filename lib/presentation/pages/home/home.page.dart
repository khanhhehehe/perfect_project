import 'package:camera/camera.dart';
import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/navigation.dart';
import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/presentation/pages/home/widgets/preview_camera.dart';
import 'package:camera_flutter/presentation/pages/main.page.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final VoidCallback? onTapMessage;
  final VoidCallback? onTapProfile;
  final CameraController controller;

  const HomePage(
      {super.key,
      required this.controller,
      this.onTapMessage,
      this.onTapProfile});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _appBar(),
          Expanded(
            child: PageView(
              children: [
                _verticalPageView([
                  ///thay widget đầu tiên bằng camera
                  TempWidget(color: Colors.black),
                  TempWidget(color: Colors.white),
                  TempWidget(color: Colors.red),
                  TempWidget(color: Colors.blueGrey),
                  TempWidget(color: Colors.yellow),
                  TempWidget(color: Colors.orange),
                ])
              ],
            ),
          ),
          // Your additional column widgets go here
          // For example:
          // Text('Additional Widget'),
        ],
      ),
    );
  }

  Widget _verticalPageView(List<Widget> child) {
    return PageView.builder(
      onPageChanged: (index) {},
      scrollDirection: Axis.vertical,
      itemCount: child.length,
      itemBuilder: (context, index) {
        return child[index];
      },
    );
  }

  // Column(
  // crossAxisAlignment: CrossAxisAlignment.center,
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: [
  // _appBar(),
  // const SizedBox(
  // height: 50,
  // ),
  // CameraPreviewHome(controller: widget.controller),
  // const Spacer(),
  // IconButton(
  // onPressed: () => _takePicture(),
  // icon: Container(
  // decoration: BoxDecoration(
  // border: Border.all(width: 2, color: Colors.white),
  // borderRadius: BorderRadius.circular(100),
  // ),
  // padding: const EdgeInsets.all(2),
  // child: const Icon(
  // Icons.circle,
  // color: Colors.white,
  // size: 58,
  // ),
  // )),
  // const Spacer(),
  // ],
  // )
  Padding _appBar() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.horizontalPadding * 0.8,
            vertical: Dimens.verticalPadding * 0.2),
        child: AppBar(
          leadingWidth: 55,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: widget.onTapProfile,
            child: const CircleAvatarWidget(
              height: 40,
              width: 40,
              path: '',
            ),
          ),
          title: GestureDetector(
            onTap: () => _showBottomSheet(context),
            child: Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.borderRadius * 40),
                  color: Colors.grey.withOpacity(0.3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.images.iconUsers,
                    color: Colors.white,
                    width: SpacingUnit.x7,
                    height: SpacingUnit.x7,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "9 Friends",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        fontFamily: ''),
                  )
                ],
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: widget.onTapMessage,
              child: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(Dimens.verticalPadding * 0.9),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimens.borderRadius * 5),
                    color: Colors.grey.withOpacity(0.3)),
                child: SvgPicture.asset(
                  Assets.images.iconChat,
                  color: Colors.white,
                  width: SpacingUnit.x8,
                  height: SpacingUnit.x8,
                ),
              ),
            )
          ],
        ),
      );

  _showBottomSheet(BuildContext context) {
    double bottomSheetHeight = Dimens.screenHeight * 0.9;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Container(
          height: bottomSheetHeight,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TempWidget extends StatelessWidget {
  final Color color;

  const TempWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: ElevatedButton(
          onPressed: () {
            getIt<AppNavigation>().push(page: Pages.profile);
          },
          child: const Text('Push sang man profile')),
    );
  }
}
