import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

final termsPage = GoRoute(
    path: Pages.term,
    builder: (context, GoRouterState state) => const TermPage());

class TermPage extends StatefulWidget {
  const TermPage({super.key});

  @override
  State<TermPage> createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
    bool _isLoading = true;

  late final WebViewController _controller;

   @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _loadWebViewContent();
  }

  Future<void> _loadWebViewContent() async {
    await _controller.loadFlutterAsset(Assets.html.term);

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
                )),
                Text(
              appLocalizations.termOfService,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
