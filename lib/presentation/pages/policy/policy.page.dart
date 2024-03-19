import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

final policyPage = GoRoute(
  path: Pages.policy,
  builder: (context, GoRouterState state) => const PolicyPage(),
);

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _loadWebViewContent();
  }

  Future<void> _loadWebViewContent() async {
    await _controller.loadFlutterAsset(Assets.html.privacy);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: MyAppColors.black,
      appBar: appBar(appLocalizations),
      body: _isLoading
          ? Container(
              color: MyAppColors.black, 
            )
          : WebViewWidget(controller: _controller),
    );
  }

  PreferredSizeWidget appBar(AppLocalizations appLocalizations) => AppBar(
        backgroundColor: MyAppColors.black,
        leadingWidth: DimensionApp.screenWidth,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: DimensionApp.screenWidth * 0.1,
              ),
            ),
            Text(
              appLocalizations.privacyPolicy,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
}
