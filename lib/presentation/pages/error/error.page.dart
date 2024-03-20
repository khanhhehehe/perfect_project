import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/presentation/widgets/error/button_go_back.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final errorPageRoute = GoRoute(
    path: Pages.error,
    builder: (context, GoRouterState state) => ErrorPage(
          imagePath: Assets.images.sunny.path,
        ));

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  final String pathError;
  final String imagePath;
  final String title;

  const ErrorPage({
    super.key,
    this.errorMessage = '',
    this.pathError = '',
    required this.imagePath,
    this.title =
        'Look like somethings had went wrong. \nPlease come back later!',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF212B45),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Oops!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: SpacingUnit.x1),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFABBFED),
                    ),
                  ),
                ),
                const SizedBox(height: SpacingUnit.x9),
                Image.asset(
                  imagePath,
                  width: SpacingUnit.x75,
                  height: SpacingUnit.x50,
                ),
                const SizedBox(height: SpacingUnit.x9),
                const ButtonGoBack()
              ],
            ),
          ),
        ));
  }
}
