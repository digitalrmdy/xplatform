# xplatform

A package to help make cross-platform UI development easier

## PlatformWrapper

PlatformWrapper is a wrapper around the Platform class to indicate if a Flutter app is running on iOS or not.
It allows you to override the current OS which so you can test iOS layouts when developing an app on an Android device.

If your app uses

```
PlatformWrapper.isCupertino
```

to check if an iOS or a Material design UI should be used, you can use

```
PlatformWrapper.overridePlatform(WrapperPlatform.Cupertino);
```

to let the PlatformWrapper act as if it was running on an iOS device, even if it is running on an Android device.
This lets you test an iOS UI without needing an actual iOS device. Because the original Platform.isIOS still returns false, everything related to permissions, platform channels, etc. will still keep working on your Android device.

## XGestureDetector

XGestureDetector uses the PlatformWrapper to detect if it should use a GestureDetector or an Inkwell to handle gestures.
On iOS a GestureDetector will be used, on all other platforms the Material design Inkwell will be used.