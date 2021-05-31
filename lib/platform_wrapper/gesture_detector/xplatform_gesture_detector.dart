import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xplatform/platform_wrapper/platform.dart';

class XPlatformGestureDetector extends StatelessWidget {
  final Function onTap;
  final Widget child;

  /// Creates an XPlatformGestureDetector.
  ///
  /// Uses [PlatformWrapper] to detect if it should use a GestureDetector or an Inkwell to handle gestures.
  /// On iOS a GestureDetector will be used, on all other platforms the Material design Inkwell will be used.
  ///
  /// The [onTap] and [child] arguments must not be
  /// null.
  XPlatformGestureDetector({required this.onTap, required this.child});

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
