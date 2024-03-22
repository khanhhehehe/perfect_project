import 'dart:io';

import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/navigation.dart';
import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/post_image/widgets/item_user.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:camera_flutter/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

final postImagePageRoute = GoRoute(
    path: Pages.postImage,
    builder: (context, GoRouterState state) {
      final query = state.uri.queryParameters;
      final filePath = query['file'];
      return PostImage(
        filePath: filePath ?? '',
      );
    });

class PostImage extends StatefulWidget {
  final String filePath;
  const PostImage({super.key, this.filePath = ''});

  @override
  State<PostImage> createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          AppBar(
            title: Text(
              appLocalizations.sendTo,
              style: TextThemeStyleApp.normal400,
            ),
            backgroundColor: Colors.transparent,
            leading: const SizedBox(),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.file_download_outlined,
                    size: SpacingUnit.x8,
                  ))
            ],
          ),
          const Spacer(),
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(SpacingUnit.x0_25),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.file(
                    File(widget.filePath),
                    fit: BoxFit.fill,
                  ))),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () => getIt<AppNavigation>().pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: SpacingUnit.x10,
                  )),
              IconButton(
                onPressed: () => {},
                icon: Container(
                  width: SpacingUnit.x22,
                  height: SpacingUnit.x22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyAppColors.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(SpacingUnit.x2_5),
                  child: SvgPicture.asset(
                    Assets.images.send,
                    width: SpacingUnit.x20,
                    height: SpacingUnit.x20,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.images.stars,
                    width: SpacingUnit.x8,
                    height: SpacingUnit.x8,
                  )),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: SpacingUnit.x10,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: SpacingUnit.x2),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  ItemUser(image: Assets.images.sunny.path),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: SpacingUnit.x2),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
