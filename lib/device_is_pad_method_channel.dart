import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_is_pad_platform_interface.dart';

/// An implementation of [DeviceIsPadPlatform] that uses method channels.
class MethodChannelDeviceIsPad extends DeviceIsPadPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_is_pad');

  @override
  Future<String?> deviceType() async {
    final version = await methodChannel.invokeMethod<String>('deviceType');
    return version;
  }
}
