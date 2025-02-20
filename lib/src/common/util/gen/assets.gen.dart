/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/GreatVibes.ttf
  String get greatVibes => 'assets/fonts/GreatVibes.ttf';

  /// File path: assets/fonts/LucySaid.ttf
  String get lucySaid => 'assets/fonts/LucySaid.ttf';

  /// List of all assets
  List<String> get values => [greatVibes, lucySaid];
}

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/centerinvetationflower.gif
  AssetGenImage get centerinvetationflower => const AssetGenImage('assets/gif/centerinvetationflower.gif');

  /// List of all assets
  List<AssetGenImage> get values => [centerinvetationflower];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bottomflowers_yellow.png
  AssetGenImage get bottomflowersYellow => const AssetGenImage('assets/images/bottomflowers_yellow.png');

  /// File path: assets/images/centerinvetationflower.JPG
  AssetGenImage get centerinvetationflower => const AssetGenImage('assets/images/centerinvetationflower.JPG');

  /// File path: assets/images/topflowers_yellow.png
  AssetGenImage get topflowersYellow => const AssetGenImage('assets/images/topflowers_yellow.png');

  /// List of all assets
  List<AssetGenImage> get values => [bottomflowersYellow, centerinvetationflower, topflowersYellow];
}

class $AssetsMusicGen {
  const $AssetsMusicGen();

  /// File path: assets/music/ed_sheeran_perfect.mp3
  String get edSheeranPerfect => 'assets/music/ed_sheeran_perfect.mp3';

  /// List of all assets
  List<String> get values => [edSheeranPerfect];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/dashboard.svg
  SvgGenImage get dashboard => const SvgGenImage('assets/svg/dashboard.svg');

  /// File path: assets/svg/instagram.svg
  SvgGenImage get instagram => const SvgGenImage('assets/svg/instagram.svg');

  /// File path: assets/svg/invitation.svg
  SvgGenImage get invitation => const SvgGenImage('assets/svg/invitation.svg');

  /// File path: assets/svg/monitor.svg
  SvgGenImage get monitor => const SvgGenImage('assets/svg/monitor.svg');

  /// File path: assets/svg/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/svg/profile.svg');

  /// File path: assets/svg/sales.svg
  SvgGenImage get sales => const SvgGenImage('assets/svg/sales.svg');

  /// File path: assets/svg/telegram.svg
  SvgGenImage get telegram => const SvgGenImage('assets/svg/telegram.svg');

  /// File path: assets/svg/user.svg
  SvgGenImage get user => const SvgGenImage('assets/svg/user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [dashboard, instagram, invitation, monitor, profile, sales, telegram, user];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMusicGen music = $AssetsMusicGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(_assetName, assetBundle: bundle, packageName: package, theme: theme);
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
