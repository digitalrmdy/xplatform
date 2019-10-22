import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xplatform/platform_wrapper/platform.dart';

class XPlatformGestureDetector extends StatelessWidget {
  final Function onTap;
  final Widget child;

  XPlatformGestureDetector({@required this.onTap, @required this.child});

  @override
  Widget build(BuildContext context) {
    if (PlatformWrapper.isCupertino) {
      return GestureDetector(
        onTap: () {
          onTap();
        },
        child: child,
      );
    } else {
      return InkWell(
          onTap: () {
            onTap();
          },
          child: child);
    }
  }
}