import 'package:flutter_svg/svg.dart';

class AppIcons {
  static const eyeClosed = 'assets/icons/eye-closed.1.1.svg';
  static const eyeOpened = 'assets/icons/eye.1.1.svg';

  static const allIcons = [
    eyeClosed,
    eyeOpened,
  ];

  static Future<void> preloadIconsSVGs() async {
    for (final asset in allIcons) {
      final loader = SvgAssetLoader(asset);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
