import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xplatform/platform_wrapper/gesture_detector/xplatform_gesture_detector.dart';
import 'package:xplatform/platform_wrapper/platform.dart';

void main() {
  testWidgets('wiget has an Inkwell when on a Material environment',
      (WidgetTester tester) async {
    PlatformWrapper.overridePlatform(WrapperPlatform.Material);

    final childWidget = Container();

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
          child: Material(
        child: XPlatformGestureDetector(
          onTap: () {},
          child: childWidget,
        ),
      )),
    );

    debugDumpApp();

    expect(find.byWidget(childWidget), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('wiget has an GestureDetector when on a Cupertino environment',
      (WidgetTester tester) async {
    PlatformWrapper.overridePlatform(WrapperPlatform.Cupertino);

    final childWidget = Container();

    await tester.pumpWidget(
      XPlatformGestureDetector(
        onTap: () {},
        child: childWidget,
      ),
    );

    expect(find.byWidget(childWidget), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(InkWell), findsNothing);

  });
}
