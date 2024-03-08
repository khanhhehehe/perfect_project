import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/navigation.dart';
import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/main.dart';
import 'package:camera_flutter/presentation/pages/error/error.page.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRouters {
  final GoRouter goRouter;

  AppRouters() : goRouter = _router;

  static GoRouter get _router => GoRouter(
      routes: routerPages,
      navigatorKey: getIt<AppNavigation>().navigatorKey,
      errorBuilder: (context, state) {
        return ErrorPage(
          imagePath: Assets.images.sunny.path,
          title: 'Look like somethings had went wrong.Please come back later!',
        );
      },
      initialLocation: '/');

  static List<GoRoute> routerPages = {
    Pages.home: homePageRoute,
  }.entries.map((entry) => entry.value).toList();
}
