import 'dart:io';

class PlatformWrapper {
  static WrapperPlatform? _overridePlatform;

  static bool get isCupertino {
    return _overridePlatform == null
        ? Platform.isIOS
        : _overridePlatform == WrapperPlatform.Cupertino;
  }

  static overridePlatform(WrapperPlatform platform) {
    _overridePlatform = platform;
  }

  static clearOverride() {
    _overridePlatform = null;
  }
}

enum WrapperPlatform {
  Material,
  Cupertino,
}
