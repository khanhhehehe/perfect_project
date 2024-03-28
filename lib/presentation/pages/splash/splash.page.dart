import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final splashPageRoute = GoRoute(
    path: Pages.splash,
    builder: (context, GoRouterState state) => const SplashPage());
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}