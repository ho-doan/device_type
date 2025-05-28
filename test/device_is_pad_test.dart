import 'package:flutter_test/flutter_test.dart';
import 'package:device_is_pad/device_is_pad.dart';
import 'package:device_is_pad/device_is_pad_platform_interface.dart';
import 'package:device_is_pad/device_is_pad_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceIsPadPlatform
    with MockPlatformInterfaceMixin
    implements DeviceIsPadPlatform {
  @override
  Future<String?> deviceType() => Future.value('42');
}

void main() {
  final DeviceIsPadPlatform initialPlatform = DeviceIsPadPlatform.instance;

  test('$MethodChannelDeviceIsPad is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceIsPad>());
  });

  test('deviceType', () async {
    DeviceIsPad deviceIsPadPlugin = DeviceIsPad.instance;
    MockDeviceIsPadPlatform fakePlatform = MockDeviceIsPadPlatform();
    DeviceIsPadPlatform.instance = fakePlatform;

    expect(await deviceIsPadPlugin.deviceType(), '42');
  });
}
