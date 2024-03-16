/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow_down.svg
  String get arrowDown => 'assets/images/arrow_down.svg';

  /// File path: assets/images/icon-instagram.svg
  String get iconInstagram => 'assets/images/icon-instagram.svg';

  /// File path: assets/images/icon-twitter.svg
  String get iconTwitter => 'assets/images/icon-twitter.svg';

  /// File path: assets/images/icon_chat.svg
  String get iconChat => 'assets/images/icon_chat.svg';

  /// File path: assets/images/icon_go_back.svg
  String get iconGoBack => 'assets/images/icon_go_back.svg';

  /// File path: assets/images/icon_users.svg
  String get iconUsers => 'assets/images/icon_users.svg';

  /// File path: assets/images/icon_widget.svg
  String get iconWidget => 'assets/images/icon_widget.svg';

  /// File path: assets/images/image.svg
  String get image => 'assets/images/image.svg';

  /// File path: assets/images/reload.svg
  String get reload => 'assets/images/reload.svg';

  /// File path: assets/images/sunny.png
  AssetGenImage get sunny => const AssetGenImage('assets/images/sunny.png');

  /// List of all assets
  List<dynamic> get values => [
        arrowDown,
        iconInstagram,
        iconTwitter,
        iconChat,
        iconGoBack,
        iconUsers,
        iconWidget,
        image,
        reload,
        sunny
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/json
  String get json => 'assets/json/json';

  /// List of all assets
  List<String> get values => [json];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
