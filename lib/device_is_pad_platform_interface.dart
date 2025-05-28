import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_is_pad_method_channel.dart';

abstract class DeviceIsPadPlatform extends PlatformInterface {
  /// Constructs a DeviceIsPadPlatform.
  DeviceIsPadPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceIsPadPlatform _instance = MethodChannelDeviceIsPad();

  /// The default instance of [DeviceIsPadPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceIsPad].
  static DeviceIsPadPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceIsPadPlatform] when
  /// they register themselves.
  static set instance(DeviceIsPadPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> deviceType() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
