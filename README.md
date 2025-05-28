# device_type

A new Flutter plugin project detect device is pad or phone.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Use

```dart
Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final s = await DeviceIsPad.instance.deviceType();
      
      ...

      runApp(const MyApp());
    },
    (e, s) {
      log(e.toString(), stackTrace: s);
      // FirebaseAppCrashlytics.logException(
      //   message: FirebaseAppCrashlytics.homeCrash,
      //   e: e,
      //   stack: s,
      // );
    },
  );
}
```
