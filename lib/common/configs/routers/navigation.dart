import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppNavigation {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  pushWithParams<T>(context, {required String page, required T args}) {
    GoRouter.of(context).push(page);
  }

  push(
      {required String page,
      String? params,
      BuildContext? buildContext,
      Map<String, dynamic>? paramsQuerry}) {
    final context = buildContext ?? navigatorKey.currentContext!;
    if (params != null) {
      final urlParams = '$page/$params';
      if (paramsQuerry != null) {
        final String urlParamsQuerry =
            _navigationQuerryParams(urlParams, paramsQuerry);
        return GoRouter.of(context).push(urlParamsQuerry);
      }

      return GoRouter.of(context).push(urlParams);
    }

    if (paramsQuerry != null) {
      final String urlParamsQuerry =
          _navigationQuerryParams(page, paramsQuerry);
      return GoRouter.of(context).push(urlParamsQuerry);
    }

    return GoRouter.of(context).push(page);
  }

  String _navigationQuerryParams(
      String baseUrl, Map<String, dynamic> paramsQuerry) {
    final String queryString = Uri(
        queryParameters: paramsQuerry
            .map((key, value) => MapEntry(key, value?.toString()))).query;
    return '$baseUrl?$queryString';
  }

  pushName(
      {required String name,
      BuildContext? buildContext,
      Map<String, dynamic>? paramsQuerry}) {
    final context = buildContext ?? navigatorKey.currentContext!;
    if (paramsQuerry != null) {
      return context.pushNamed(name, queryParameters: paramsQuerry);
    }

    return context.pushNamed(name);
  }

  popUtil(
    page, {
    BuildContext? buildContext,
  }) {
    final context = buildContext ?? navigatorKey.currentContext!;
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;
    final routes = delegate.currentConfiguration.routes.reversed.toList();
    for (var i = 0; i < routes.length; i++) {
      final route = routes[i] as GoRoute;
      if (route.path == page) return;
      GoRouter.of(context).pop();
    }
  }

  isContainsPage(
    page, {
    BuildContext? buildContext,
  }) {
    final context = buildContext ?? navigatorKey.currentContext!;
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;
    final routes = delegate.currentConfiguration.routes.reversed
        .map((e) => e as GoRoute)
        .toList();
    return routes.map((e) => e.path).contains(page);
  }

  isCurrentPage(
    page, {
    BuildContext? buildContext,
  }) {
    final context = buildContext ?? navigatorKey.currentContext!;
    final router = GoRouter.of(context);
    final GoRouterDelegate delegate = router.routerDelegate;
    final routes = delegate.currentConfiguration.routes.reversed
        .map((e) => e as GoRoute)
        .toList();
    final currentPage = routes.first;
    return currentPage.path.contains(page);
  }

  go(
      {required String page,
      String? params,
      BuildContext? buildContext,
      Map<String, dynamic>? paramsQuerry}) {
    final context = buildContext ?? navigatorKey.currentContext!;
    if (params != null) {
      final urlParams = '$page/$params';
      if (paramsQuerry != null) {
        final String urlParamsQuerry =
            _navigationQuerryParams(urlParams, paramsQuerry);
        return GoRouter.of(context).go(urlParamsQuerry);
      }

      return GoRouter.of(context).go(urlParams);
    }

    if (paramsQuerry != null) {
      final String urlParamsQuerry =
          _navigationQuerryParams(page, paramsQuerry);
      return GoRouter.of(context).go(urlParamsQuerry);
    }
    return GoRouter.of(context).go(page);
  }

  replace(
      {required String page,
      String? params,
      BuildContext? buildContext,
      Map<String, dynamic>? paramsQuerry}) {
    final context = buildContext ?? navigatorKey.currentContext!;
    if (params != null) {
      final urlParams = '$page/$params';
      if (paramsQuerry != null) {
        final String urlParamsQuerry =
            _navigationQuerryParams(urlParams, paramsQuerry);
        return GoRouter.of(context).pushReplacement(urlParamsQuerry);
      }

      return GoRouter.of(context).pushReplacement(urlParams);
    }

    if (paramsQuerry != null) {
      final String urlParamsQuerry =
          _navigationQuerryParams(page, paramsQuerry);
      return GoRouter.of(context).pushReplacement(urlParamsQuerry);
    }
    return GoRouter.of(context).pushReplacement(page);
  }

  pop({BuildContext? buildContext}) {
    final context = buildContext ?? navigatorKey.currentContext!;
    return GoRouter.of(context).pop();
  }
}
