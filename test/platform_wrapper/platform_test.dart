import 'package:flutter_test/flutter_test.dart';
import 'package:xplatform/platform_wrapper/platform.dart';

void main() {
  test('when not overriden, it is not cupertino', () {
    expect(PlatformWrapper.isCupertino, isFalse);
  });

  test('when overriden as cupertino, it is cupertino', () {
    PlatformWrapper.overridePlatform(WrapperPlatform.Cupertino);
    expect(PlatformWrapper.isCupertino, isTrue);
    PlatformWrapper.clearOverride();
    expect(PlatformWrapper.isCupertino, isFalse);
  });
}
