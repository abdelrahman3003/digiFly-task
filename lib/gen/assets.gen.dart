/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Google.svg
  String get google => 'assets/icons/Google.svg';

  /// File path: assets/icons/arrow-simple.svg
  String get arrowSimple => 'assets/icons/arrow-simple.svg';

  /// File path: assets/icons/back-arrow.svg
  String get backArrow => 'assets/icons/back-arrow.svg';

  /// File path: assets/icons/contact.svg
  String get contact => 'assets/icons/contact.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// File path: assets/icons/exclamation.svg
  String get exclamation => 'assets/icons/exclamation.svg';

  /// File path: assets/icons/favourite.svg
  String get favourite => 'assets/icons/favourite.svg';

  /// File path: assets/icons/flter.svg
  String get flter => 'assets/icons/flter.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/language.svg
  String get language => 'assets/icons/language.svg';

  /// File path: assets/icons/lock-solid 1.svg
  String get lockSolid1 => 'assets/icons/lock-solid 1.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/mail.svg
  String get mail => 'assets/icons/mail.svg';

  /// File path: assets/icons/person.svg
  String get person => 'assets/icons/person.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/setting.svg
  String get setting => 'assets/icons/setting.svg';

  /// File path: assets/icons/sign out.svg
  String get signOut => 'assets/icons/sign out.svg';

  /// File path: assets/icons/text_editor.svg
  String get textEditor => 'assets/icons/text_editor.svg';

  /// List of all assets
  List<String> get values => [
        google,
        arrowSimple,
        backArrow,
        contact,
        edit,
        exclamation,
        favourite,
        flter,
        home,
        language,
        lockSolid1,
        logo,
        mail,
        person,
        profile,
        setting,
        signOut,
        textEditor
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/box.png
  AssetGenImage get box => const AssetGenImage('assets/images/box.png');

  /// File path: assets/images/fly.png
  AssetGenImage get fly => const AssetGenImage('assets/images/fly.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/profle_pic.png
  AssetGenImage get proflePic =>
      const AssetGenImage('assets/images/profle_pic.png');

  /// List of all assets
  List<AssetGenImage> get values => [box, fly, logo, proflePic];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
